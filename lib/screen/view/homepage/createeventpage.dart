import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/createevent_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/data/dataScore/static/auth/neighborhoodData.dart';

import 'package:ourcommunity/screen/widgets/auth/dropdownButton.dart';
import 'package:ourcommunity/screen/widgets/createevent/ImageUploadCard.dart';
import 'package:ourcommunity/screen/widgets/createevent/custom_text_field.dart';
import 'package:ourcommunity/screen/widgets/homepage/add_event/set_date_range.dart';
import 'package:ourcommunity/screen/widgets/homepage/profile/inviteteam/customPrimaryButton.dart';

import '../../../data/dataScore/static/event/event_category.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateEventControllerImp());

    return Scaffold(
      backgroundColor: Appcolor.colorbackground,
      appBar: AppBar(
        backgroundColor: Appcolor.colorbackground,
        elevation: 0,
        title: const Text(
          "Create Event",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
            fontFamily: "cairo",
            letterSpacing: 0.4,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Appcolor.primarycolor),
      ),
      body: GetBuilder<CreateEventControllerImp>(
        builder: (controller) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Form(
            key: controller.key,
            child: HandlingDataView(
              status: controller.statusR,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  CustomTextField(
                    controller: controller.titleController,
                    hint: "Event Title",
                    keyboard: TextInputType.text,
                    maxLines: 1,
                    validator: (value) => validateField(
                      value: value,
                      fieldType: "text",
                      minWords: 5,
                      maxWords: 150,
                    ),
                    hintText: "Event Title",
                  ),
                  const SizedBox(height: 16),

                  // Description
                  CustomTextField(
                    controller: controller.descriptionController,
                    hint: "Description",
                    keyboard: TextInputType.text,
                    maxLines: 4,
                    validator: (value) => validateField(
                      value: value,
                      fieldType: "text",
                      minWords: 5,
                      maxWords: 400,
                    ),
                    hintText: "Enter event description",
                  ),
                  const SizedBox(height: 16),

                  // Cover Photo
                  Text(
                    "Cover Photo",
                    style: TextStyle(
                      color: Appcolor.black.withOpacity(0.85),
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 6),
                  ImageUploadCard(
                    imageUrl: controller.coverImage,
                    onPickImage: () => controller.pickImage(),
                  ),
                  const SizedBox(height: 18),

                  // Date Selection
                  SetDateRange(
                    onsetStartDate: controller.selectStartDate,
                    onsetEndDate: controller.selectEndDate,
                    startDate: controller.selectedStartDate,
                    endDateDate: controller.selectedEndDate,
                  ),
                  const SizedBox(height: 18),

                  // City and Neighborhood
                  Text(
                    "City",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Appcolor.black.withOpacity(0.75),
                    ),
                  ),
                  CustomDropdownButton(
                    dataList: cities,
                    hintText: controller.selectedCity ?? "",
                    onChanged: (value) {
                      controller.selectCity(value);
                    },
                    onTap: () => controller.showGovernorate(),
                  ),
                  const SizedBox(height: 10),
                  if (controller.showArea == true)
                    Text(
                      "Governorate",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Appcolor.black.withOpacity(0.75),
                      ),
                    ),
                  if (controller.showArea == true)
                    CustomDropdownButton(
                      dataList: neighborhoods[controller.selectedCity] ?? [],
                      hintText: controller.selectedGovernorate ?? "",
                      onChanged: (value) {
                        controller.selectGovernorate(value);
                      },
                    ),

                  const SizedBox(height: 18),
                  Text(
                    "Category",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Appcolor.black.withOpacity(0.75),
                    ),
                  ),
                  CustomDropdownButton(
                    dataList: controller.categoryList
                        .map((e) => e['category_name'].toString())
                        .toList(),
                    hintText: "Select Category",
                    onChanged: (selectedName) {
                      final selected = controller.categoryList.firstWhere(
                        (e) => e['category_name'] == selectedName,
                      );
                      if (selected != null) {
                        controller.selectEventCategory(selected['id']);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Team",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Appcolor.black.withOpacity(0.75),
                    ),
                  ),
                  CustomDropdownButton(
                    dataList: controller.teamDataList
                        .map((e) => e['team_name'].toString())
                        .toList(),
                    hintText: "Select Team",
                    onChanged: (selectedName) {
                      final selected = controller.teamDataList.firstWhere(
                        (e) => e['team_name'] == selectedName,
                      );
                      if (selected != null) {
                        controller.selectTeam(selected['id']);
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  // Capacity
                  CustomTextField(
                    controller: controller.capacityController,
                    hint: "Capacity",
                    keyboard: TextInputType.number,
                    maxLines: 1,
                    validator: (value) => validateField(
                      value: value,
                      fieldType: "number",
                      minWords: 1,
                      maxWords: 4,
                    ),
                    hintText: "Number of Participants",
                  ),
                  const SizedBox(height: 26),

                  Center(
                    child: CustomPrimaryButton(
                      text: "Create Event",
                      onPressed: controller.createEvent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// builder_id