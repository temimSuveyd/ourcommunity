import 'package:flutter/material.dart';
import 'package:ourcommunity/core/constant/color.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.dataList,
    required this.onChanged,
    required this.hintText,
    this.onTap, this.height, 
  });
  final List<String> dataList;
  final Function(String) onChanged;
  final String hintText;
  final Function()? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??50,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: DropdownButtonFormField<String>(
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        dropdownColor: Appcolor.colorbackground,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
          filled: true,
          fillColor: Colors.transparent,
          // same style as textfields
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.shade200,
              width: 1.5,
            ),
          ),

          
          // prefixIcon: Icon(icon?? null),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        icon:  Icon(Icons.arrow_drop_down_rounded),
        items: dataList
            .toSet() // tekrarları temizler
            .map((city) => DropdownMenuItem<String>(
                  value: city,
                  child: Text(city),
                ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            onChanged(value);
          }
        },
      ),
    );
  }
}
