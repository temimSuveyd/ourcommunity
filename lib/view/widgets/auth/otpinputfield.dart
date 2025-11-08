import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPInputFields extends StatelessWidget {
  final List<TextEditingController> controllers;
  final int fieldCount;
  final void Function(String value, int index)? onChanged;

  const OTPInputFields({
    super.key,
    required this.controllers,
    this.fieldCount = 6,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        fieldCount,
            (index) => SizedBox(
          width: 50.w,
          child: TextField(
            controller: controllers[index],
            maxLength: 1,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              counterText: "",
              filled: true,
              fillColor: Colors.grey.shade300,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              if (onChanged != null) {
                onChanged!(value, index);
              }
              if (value.isNotEmpty && index < fieldCount - 1) {
                FocusScope.of(context).nextFocus();
              }
            },
          ),
        ),
      ),
    );
  }
}
