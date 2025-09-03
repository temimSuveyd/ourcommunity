import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ourcommunity/screen/widgets/homepage/customBottomNavBar.dart';
import 'package:ourcommunity/screen/widgets/homepage/eventCard.dart';
import 'package:ourcommunity/screen/widgets/homepage/filterButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🔹 العنوان
              Text(
                "محلي",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 15.h),

              /// 🔹 مربع البحث
              TextField(
                decoration: InputDecoration(
                  hintText: "ابحث عن فعالية...",
                  prefixIcon: const Icon(Iconsax.search_normal),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                ),
              ),
              SizedBox(height: 15.h),

              /// 🔹 أزرار الفلترة
              Row(
                children: [
                  // زر الفلترة
                  FilterButton(icon: Iconsax.filter, text: "فلترة"),
                  SizedBox(width: 10.w),

                  // Dropdown للفئات
                  DropdownButton<String>(
                    hint: Text("كل الفئات"),
                    items: [
                      DropdownMenuItem(value: "1", child: Text("الفئة 1")),
                      DropdownMenuItem(value: "2", child: Text("الفئة 2")),
                    ],
                    onChanged: (value) {
                      // هنا تكتب الأكشن عند اختيار عنصر
                    },
                  ),
                  SizedBox(width: 10.w),

                  // Dropdown للمحافظات
                  DropdownButton<String>(
                    hint: Text("كل المحافظات"),
                    items: [
                      DropdownMenuItem(value: "cairo", child: Text("القاهرة")),
                      DropdownMenuItem(value: "giza", child: Text("الجيزة")),
                    ],
                    onChanged: (value) {
                      // هنا تكتب الأكشن عند اختيار المحافظة
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),

              /// 🔹 عنوان القائمة
              Text(
                "الفعاليات المتاحة",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15.h),

              /// 🔹 قائمة الفعاليات
              Expanded(
                child: ListView(
                  children: const [
                    EventCard(
                      title: "بطولة كرة قدم شبابية",
                      date: "الثلاثاء, 20 أغسطس",
                      location: "الفحيحيل, الأحمدي",
                    ),
                    SizedBox(height: 15),
                    EventCard(
                      title: "مهرجان موسيقي",
                      date: "الجمعة, 5 سبتمبر",
                      location: "السالمية, حولي",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// 🔹 شريط التنقل السفلي
      bottomNavigationBar: const CustomBottomNavBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 28, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

