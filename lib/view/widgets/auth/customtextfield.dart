import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 🔹 Custom TextField Widget
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;
  final IconData? suffix;
  final TextEditingController? controller;
  final Function()? onPressed;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.icon,
    this.obscure = false,
    this.suffix,
    this.controller,
    this.onPressed,
    required this.validator,
    this.keyboardType,
    this.onChanged ,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged!(value),
      keyboardType: keyboardType ?? TextInputType.text,
      validator: (value) => validator(value),
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade700),
        suffixIcon: suffix != null
            ? IconButton(onPressed: onPressed, icon: Icon(suffix))
            : null,
        filled: true,
        fillColor: const Color.fromARGB(255, 228, 228, 228),
        hintStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.blue, // focus border color
            width: 1.8,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red, // error border color
            width: 1.8,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red, // error border color focused
            width: 2,
          ),
        ),
      ),
    );
  }
}
