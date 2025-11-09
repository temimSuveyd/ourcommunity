import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/event/create_event_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/data/dataScore/static/auth/neighborhoodData.dart';
import 'package:ourcommunity/data/dataScore/static/home/filter_data.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/auth/dropdownButton.dart';
import 'package:ourcommunity/view/widgets/createevent/ImageUploadCard.dart';
import 'package:ourcommunity/view/widgets/createevent/custom_text_field.dart';
import 'package:ourcommunity/view/widgets/homepage/add_event/set_date_range.dart';

class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CreateEventControllerImp());

    return Scaffold(
      backgroundColor: Appcolor.backgroundColor,
      appBar:  CustomAppBar(
        'Create Event',
        () => Get.back(),
      ),
      body: GetBuilder<CreateEventControllerImp>(
        builder: (controller) => _buildBody(controller),
      ),
    );
  }


  Widget _buildBody(CreateEventControllerImp controller) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Form(
        key: controller.key,
        child: HandlingDataView(
          status: controller.statusR,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEventDetailsSection(controller),
              SizedBox(height: 24.h),
              _buildLocationSection(controller),
              SizedBox(height: 24.h),
              _buildEventSettingsSection(controller),
              SizedBox(height: 24.h),
              _buildPricingSection(controller),
              SizedBox(height: 32.h),
              _buildCreateButton(controller),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventDetailsSection(CreateEventControllerImp controller) {
    return _buildSectionCard(
      title: "Event Details",
      icon: Icons.event,
      children: [
        _buildFormField(
          label: "Event Title",
          child: CustomTextField(
            controller: controller.titleController,
            hint: "Enter event title",
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
        ),
        SizedBox(height: 16.h),
        _buildFormField(
          label: "Description",
          child: CustomTextField(
            controller: controller.descriptionController,
            hint: "Describe your event",
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
        ),
        SizedBox(height: 16.h),
        _buildFormField(
          label: "Cover Photo",
          child: ImageUploadCard(
            imageUrl: controller.coverImage,
            onPickImage: () => controller.pickImage(),
          ),
        ),
        SizedBox(height: 16.h),
        _buildFormField(
          label: "Event Dates",
          child: SetDateRange(
            onsetStartDate: controller.selectStartDate,
            onsetEndDate: controller.selectEndDate,
            startDate: controller.selectedStartDate,
            endDateDate: controller.selectedEndDate,
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection(CreateEventControllerImp controller) {
    return _buildSectionCard(
      title: "Location",
      icon: Icons.location_on,
      children: [
        _buildFormField(
          label: "City",
          child: CustomDropdownButton(
            dataList: cities,
            hintText: controller.selectedCity ?? "Select City",
            height: 48.h,
            onChanged: (value) => controller.selectCity(value),
            onTap: () => controller.showGovernorate(),
          ),
        ),
        if (controller.showArea) ...[
          SizedBox(height: 16.h),
          _buildFormField(
            label: "Governorate",
            child: CustomDropdownButton(
              dataList: neighborhoods[controller.selectedCity] ?? [],
              hintText: controller.selectedGovernorate ?? "Select Governorate",
              height: 48.h,
              onChanged: (value) => controller.selectGovernorate(value),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildEventSettingsSection(CreateEventControllerImp controller) {
    return _buildSectionCard(
      title: "Event Settings",
      icon: Icons.settings,
      children: [
        _buildFormField(
          label: "Category",
          child: CustomDropdownButton(
            dataList: controller.categoryList
                .map((e) => e['category_name'].toString())
                .toList(),
            hintText: "Select Category",
            height: 48.h,
            onChanged: (selectedName) {
              final selected = controller.categoryList.firstWhere(
                (e) => e['category_name'] == selectedName,
              );
              controller.selectCategory(
                  selected['id'], selected['category_name']);
            },
          ),
        ),
        SizedBox(height: 16.h),
        _buildFormField(
          label: "Team",
          child: CustomDropdownButton(
            dataList: controller.teamDataList
                .map((e) => e['team_name'].toString())
                .toList(),
            hintText: "Select Team",
            height: 48.h,
            onChanged: (selectedName) {
              final selected = controller.teamDataList.firstWhere(
                (e) => e['team_name'] == selectedName,
              );
              controller.selectTeam(selected['id'], selected['team_name']);
            },
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildFormField(
                label: "Gender",
                child: CustomDropdownButton(
                  dataList: genderList,
                  hintText: "Gender",
                  height: 48.h,
                  onChanged: (value) => controller.selectGender(value),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildFormField(
                label: "Age Group",
                child: CustomDropdownButton(
                  dataList: ageGroupList,
                  hintText: "Age Group",
                  height: 48.h,
                  onChanged: (value) => controller.selectAgeGroup(value),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        _buildFormField(
          label: "Capacity",
          child: CustomTextField(
            controller: controller.capacityController,
            hint: "Number of participants",
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
        ),
      ],
    );
  }

  Widget _buildPricingSection(CreateEventControllerImp controller) {
    return _buildSectionCard(
      title: "Pricing",
      icon: Icons.attach_money,
      children: [
        _buildFormField(
          label: "Price",
          child: CustomTextField(
            controller: controller.priceController,
            hint: "Enter price (leave empty for free event)",
            keyboard: TextInputType.number,
            maxLines: 1,
            validator: (value) => validateField(
              value: value,
              fieldType: "number",
              minWords: 0,
              maxWords: 6,
            ),
            hintText: "Price",
          ),
        ),
      ],
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Appcolor.primarycolor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  icon,
                  color: Appcolor.primarycolor,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Appcolor.primarTextcolor,

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ...children,
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Appcolor.primarTextcolor.withOpacity(0.8),
          ),
        ),
        SizedBox(height: 8.h),
        child,
      ],
    );
  }

  Widget _buildCreateButton(CreateEventControllerImp controller) {
    return Container(
      width: double.infinity,
      height: 56.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [
            Appcolor.primarycolor,
            Appcolor.primarycolor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Appcolor.primarycolor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: controller.createEvent,
          child: Container(
            alignment: Alignment.center,
            child: Text(
              "Create Event",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

