
// ✅ صورة الفعالية + زر الرجوع + الكارد
//
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EventImageHeader extends StatelessWidget {
final Map<String, dynamic> event;
const EventImageHeader({super.key, required this.event});

@override
Widget build(BuildContext context) {
return Stack(
clipBehavior: Clip.none,
children: [
ClipRRect(
borderRadius: BorderRadius.only(
bottomLeft: Radius.circular(25.r),
bottomRight: Radius.circular(25.r),
),
child: Image.network(
event["image"] ?? "https://picsum.photos/600/300?random=100",
width: double.infinity,
height: 280.h,
fit: BoxFit.cover,
errorBuilder: (context, error, stackTrace) {
return Image.asset(
"assets/images/default_event.png",
width: double.infinity,
height: 280.h,
fit: BoxFit.cover,
);
},
),
),
Positioned(
top: 40.h,
right: 16.w,
child: CircleAvatar(
backgroundColor: Colors.white.withOpacity(0.6),
child: IconButton(
icon: const Icon(Icons.arrow_back, color: Colors.black),
onPressed: () => Get.back(),
),
),
),
Positioned(
bottom: -70.h,
left: 16.w,
right: 16.w,
child: Card(
color: Colors.white.withOpacity(0.95),
elevation: 6,
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(15.r),
),
child: Padding(
padding: EdgeInsets.all(20.w),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
event["title"] ?? "بدون عنوان",
style: TextStyle(
fontSize: 25.sp,
fontWeight: FontWeight.bold,
color: Colors.black,
fontFamily: "cairo",
),
),
SizedBox(height: 10.h),
Row(
children: [
CircleAvatar(
radius: 20.r,
backgroundImage: NetworkImage(
event["organizerImage"] ??
"https://via.placeholder.com/150",
),
),
SizedBox(width: 10.w),
Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
"منظم بواسطة",
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
color: Colors.black,
fontFamily: "cairo",
),
),
Text(
event["organizerName"] ?? "غير معروف",
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
color: Colors.grey.shade600,
fontFamily: "cairo",
),
),
],
),
],
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
