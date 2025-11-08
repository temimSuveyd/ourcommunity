import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ourcommunity/core/constant/color.dart';

class EventImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double height;
  final double borderRadius;

  const EventImageWidget({
    super.key,
    this.imageUrl,
    this.height = 155,
    this.borderRadius = 20,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius.r)),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              height: height.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => _buildPlaceholder(),
              errorWidget: (context, error, stackTrace) => _buildErrorWidget(),
            )
          : _buildNoImageWidget(),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      height: height.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Appcolor.primarycolor.withOpacity(0.05),
            Appcolor.primarycolor.withOpacity(0.12),
          ],
        ),
      ),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor: AlwaysStoppedAnimation<Color>(
            Appcolor.primarycolor.withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Appcolor.primarycolor.withOpacity(0.08),
            Appcolor.primarycolor.withOpacity(0.15),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported_outlined,
            size: 48.sp,
            color: Appcolor.primarycolor.withOpacity(0.4),
          ),
          SizedBox(height: 8.h),
          Text(
            'Görsel Yüklenemedi',
            style: TextStyle(
              color: Appcolor.primarycolor.withOpacity(0.5),
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNoImageWidget() {
    return Container(
      height: height.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Appcolor.primarycolor.withOpacity(0.06),
            Appcolor.primarycolor.withOpacity(0.12),
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_outlined,
            size: 52.sp,
            color: Appcolor.primarycolor.withOpacity(0.3),
          ),
          SizedBox(height: 8.h),
          Text(
            'Etkinlik Görseli',
            style: TextStyle(
              color: Appcolor.primarycolor.withOpacity(0.4),
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
