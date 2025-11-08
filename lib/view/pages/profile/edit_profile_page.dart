import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/core/class/handlingDataView.dart';
import 'package:ourcommunity/core/functions/validateField.dart';
import 'package:ourcommunity/data/dataScore/static/auth/citys_data.dart';
import 'package:ourcommunity/data/dataScore/static/auth/neighborhoodData.dart';
import 'package:ourcommunity/view/widgets/custom_widgets/app_bar.dart';
import 'package:ourcommunity/view/widgets/auth/dropdownButton.dart';
import '../../../controller/profile/edit_profile_controller.dart';
import '../../../core/constant/color.dart';
import '../../widgets/homepage/profile/editprofile/customLabeledTextField.dart';
import '../../widgets/homepage/profile/editprofile/profileAvatarPicker.dart';
import '../../widgets/homepage/profile/editprofile/savebuttom.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => EditProfileControllerImp());

    return Scaffold(
      backgroundColor: Appcolor.colorbackground,
      appBar: 
      
      CustomAppBar('Edit Profile', () => Get.back(),),
      body: GetBuilder<EditProfileControllerImp>(
        builder: (controller) => HandlingDataView(
          status: controller.statusR,
          child: Form(
            key: controller.key,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profil resmi yukarıda ve ortada
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Appcolor.primarycolor,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Appcolor.primarycolor.withOpacity(0.08),
                            blurRadius: 16,
                            spreadRadius: 3,
                          )
                        ],
                      ),
                      child: ProfileAvatarPicker(
                          onPressed: () => controller.pickeImage(),
                          imageUrl: controller.userModel!.photo!),
                    ),
                  ),
                  SizedBox(height: 30.h),

                  CustomLabeledTextField(
                    controller: controller.nameController,
                    label: "Full name",
                    icon: Iconsax.user,
                    validator: (value) => validateField(
                        value: value,
                        fieldType: "name",
                        minWords: 4,
                        maxWords: 40),
                  ),

                  SizedBox(height: 10.h),

                  CustomLabeledTextField(
                    controller: controller.ageController,
                    label: "Age",
                    icon: Iconsax.calendar,
                    validator: (value) => validateField(
                        value: value,
                        fieldType: "age",
                        minWords: 1,
                        maxWords: 2),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10.h),

                  // DropdownButton for city selection
                  Text(
                    'City',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Appcolor.grey,
                    ),
                  ),

                  CustomDropdownButton(
                    onTap: () => controller.showNeighborhood(),
                    hintText: controller.userModel!.city ?? "Choose your city",
                    dataList: cities,
                    onChanged: (String city) {
                      controller.selectCity(city);
                    },
                  ),
                  SizedBox(height: 10.h),

                  // DropdownButton for neighbourhood selection
                  if (controller.showneighborhood != false)
                    Text(
                      'Neighborhood',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Appcolor.grey,
                      ),
                    ),
                  if (controller.showneighborhood != false)
                    CustomDropdownButton(
                      hintText: controller.userModel!.neighborhood!,
                      dataList: neighborhoods[controller.userModel!.city] ?? [],
                      onChanged: (String neighborhood) {
                        controller.selectNeighborhood(neighborhood);
                      },
                    ),

                  SizedBox(height: 32.h),
                  // Save butonu tam genişlikte
                  SizedBox(
                    width: double.infinity,
                    child: SaveButton(
                      onPressed: () => controller.updateUserData(),
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
