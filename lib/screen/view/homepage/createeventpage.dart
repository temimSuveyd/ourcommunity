import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ourcommunity/controller/createevent_controller.dart';
import 'package:ourcommunity/core/constant/color.dart';
import 'package:ourcommunity/screen/widgets/createevent/ImageUploadCard.dart';
import 'package:ourcommunity/screen/widgets/createevent/buildDateField.dart';
import 'package:ourcommunity/screen/widgets/createevent/buildDropdown.dart';
import 'package:ourcommunity/screen/widgets/createevent/buildTextField.dart';
import 'package:ourcommunity/screen/widgets/homepage/profile/inviteteam/customPrimaryButton.dart';


class CreateEventPage extends StatelessWidget {
  const CreateEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateEventController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        title: Text(
          "إنشاء فعالية جديدة",
          style: TextStyle(
            color: Appcolor.black,
            fontSize: 18.sp,
            fontFamily: "cairo",
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "شارك مجتمعك",
                style: TextStyle(
                  color: Appcolor.primarycolor,
                  fontSize: 24.sp,
                  fontFamily: "cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(
              child: Text(
                "املأ التفاصيل أدناه لإنشاء فعاليتك الجديدة",
                style: TextStyle(
                  color: Appcolor.grey,
                  fontSize: 14.sp,
                  fontFamily: "cairo",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20.h),

            // عنوان الفعالية
            buildTextField(
              "عنوان الفعالية",
              "اكتب عنوان الفعالية هنا",
              controller.titleController,
            ),

            // وصف الفعالية
            buildTextField(
              "وصف الفعالية",
              "صف فعاليتك بشكل مختصر",
              controller.descriptionController,
              maxLines: 3,
            ),

            SizedBox(height: 10.h),

            // صورة الغلاف
            // صورة الغلاف
            Text("غلاف الفعالية",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    fontFamily: "cairo")),
            SizedBox(height: 6.h),
            ImageUploadCard(
              imageFile: controller.coverImage, // Rx<File?>
              onPickImage: controller.pickImage, // دالة اختيار الصورة
            ),



            SizedBox(height: 20.h),

            // تواريخ
            // تواريخ
            buildDateField("تاريخ البدء", controller, true, context),
            buildDateField("تاريخ الانتهاء", controller, false, context),


            SizedBox(height: 20.h),

            // المحافظة
            buildDropdown(
              "المحافظة",
              controller.governorates,
              controller.selectedGovernorate,
                  (val) {
                controller.selectedGovernorate.value = val ?? "";
                controller.selectedArea.value = "";
              },
              hint: "اختر المحافظة",
            ),

            SizedBox(height: 10.h),

            // المنطقة
            Obx(() {
              final areas = controller.areas[controller.selectedGovernorate
                  .value] ?? [];
              return buildDropdown(
                "المنطقة",
                areas,
                controller.selectedArea,
                    (val) => controller.selectedArea.value = val ?? "",
                hint: "اختر المنطقة",
              );
            }),

            SizedBox(height: 10.h),

            // الفئة
            buildDropdown(
              "الفئة",
              controller.categories,
              controller.selectedCategory,
                  (val) => controller.selectedCategory.value = val ?? "",
              hint: "اختر الفئة",
            ),

            SizedBox(height: 10.h),

            // السعة
            buildTextField(
              "السعة (عدد الأشخاص)",
              "أدخل العدد المسموح",
              controller.capacityController,
              keyboard: TextInputType.number,
            ),

            SizedBox(height: 10.h),

            // الفريق
            buildDropdown(
              "منظم بواسطة (فريق)",
              controller.teams,
              controller.selectedTeam,
                  (val) => controller.selectedTeam.value = val ?? "",
              hint: "اختر الفريق المنظم",
            ),

            SizedBox(height: 30.h),

            // زر الإنشاء
            CustomPrimaryButton(text: "إنشاء الفعالية", onPressed: () {  },),

          ],
        ),
      ),
    );
  }

}
