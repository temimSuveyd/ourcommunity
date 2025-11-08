import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;
  final VoidCallback? onFacebookTap;

  const SocialLoginButtons({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
    this.onFacebookTap,
  });

  Widget _buildSocialButton(IconData icon, Color color, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50.r),
      child: Container(
        height: 50.h,
        width: 50.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Icon(icon, size: 28, color: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialButton(Icons.g_mobiledata, Colors.red, onTap: onGoogleTap),
        _buildSocialButton(Icons.apple, Colors.black, onTap: onAppleTap),
        _buildSocialButton(Icons.facebook, Colors.blue, onTap: onFacebookTap),
      ],
    );
  }
}
