
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🔹 Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final IconData? suffix;
  final TextEditingController? controller ;
  final Function()? onPressed;

  const CustomTextField({
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix, 
     this.controller,
     this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade700),
        suffixIcon: suffix != null ? IconButton(onPressed: onPressed, icon: Icon(Icons.password)) : null,
        filled: true,
        fillColor: Colors.grey[300],
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
