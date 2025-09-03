import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🔹 Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final IconData? suffix;
  final TextEditingController ? controller;
  final Key? textFieldKey;
final void Function()? onPressed ;
  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix,
    this.controller,
    this.textFieldKey, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: textFieldKey,
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade700),
        suffixIcon: IconButton(
            onPressed: () => onPressed!() ,
            icon: Icon(
              suffix ?? null,
              color: Colors.grey.shade700,
            )),
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
