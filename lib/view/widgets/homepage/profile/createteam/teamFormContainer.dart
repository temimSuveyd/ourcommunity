import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/team/create_team_controller.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import 'package:ourcommunity/view/widgets/auth/dropdownButton.dart';
import 'package:ourcommunity/view/widgets/homepage/profile/inviteteam/customPrimaryButton.dart';

class TeamFormContainer extends StatelessWidget {
  const TeamFormContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTeamControllerImp>(
      builder: (controller) => HandlingDataView(
        status: controller.statusR,
        child: Form(
          key: controller.key,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Team Icon
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: Icon(Icons.group,
                      size: 40.sp, color: Appcolor.primarycolor),
                ),
                SizedBox(height: 16.h),

                // Title
                Text(
                  "Start your own community",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: "cairo",
                    color: Appcolor.black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Create a team to gather your community members and organize shared events and activities.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "cairo",
                    color: Appcolor.grey2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 24.h),

                // Fields
                _buildFormCard(context, controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormCard(
      BuildContext context, CreateTeamControllerImp controller) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Appcolor.white,
        border: Border.all(color: Appcolor.grey),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(
            "Team name",
            "e.g. Salmiya Lions",
            controller.nameController,
            (value) => validateField(
                value: value, fieldType: "text", minWords: 6, maxWords: 44),
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            "Team description",
            "Describe your team and its goals in a short sentence...",
            controller.descrabtionController,
            (value) => validateField(
                value: value, fieldType: "text", minWords: 10, maxWords: 200),
          ),
          SizedBox(height: 24,),
                    CustomDropdownButton(
            dataList: controller.categoryDataList
                .map((e) => e['category_name'].toString())
                .toList(),
            hintText: "Select Category",
            height: 48.h,
            onChanged: (selectedName) {
              final selected = controller.categoryDataList.firstWhere(
                (e) => e['category_name'] == selectedName,
              );
              controller.selectCategory(
                  selected['id'], selected['category_name']);
            },
          ),
          SizedBox(height: 16.h),
          _buildUploadSection(controller),
          SizedBox(height: 24.h),
          CustomPrimaryButton(
            text: "create",
            onPressed: () {
              controller.createTeam();
            },
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, Function(String?) validator,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            color: Appcolor.black,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
        SizedBox(height: 6.h),
        TextFormField(
          validator: (value) => validator(value),
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Appcolor.grey,
              fontWeight: FontWeight.bold,
              fontFamily: "cairo",
            ),
            filled: true,
            fillColor: Appcolor.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: Colors.blue, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUploadSection(CreateTeamController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Team logo",
          style: TextStyle(
            fontSize: 15.sp,
            color: Appcolor.black,
            fontWeight: FontWeight.bold,
            fontFamily: "cairo",
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: () {
            controller.pickeImage();
          },
          child: Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                color: Colors.grey.shade400,
                style: BorderStyle.solid,
                width: 1,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.cloud_upload_outlined,
                      size: 36.sp, color: Colors.blue),
                  SizedBox(height: 8.h),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "cairo",
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        const TextSpan(
                            text: "Drag and drop your logo here, or "),
                        TextSpan(
                          text: "Browse files",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: "cairo",
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const TextSpan(text: "\nPNG, JPG, SVG"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
