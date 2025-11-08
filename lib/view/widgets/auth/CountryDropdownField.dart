// lib/pages/widgets/auth/country_dropdown_field.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CountryDropdownField extends StatelessWidget {
  final String? selectedCountry;
  final Function(String?) onChanged;

  const CountryDropdownField({
    super.key,
    required this.selectedCountry,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    List<String> countries = [
      'egypt'.tr,
      'saudi'.tr,
      'uae'.tr,
      'qatar'.tr,
      'kuwait'.tr,
      'oman'.tr,
      'bahrain'.tr,
      'jordan'.tr,
      'lebanon'.tr,
      'syria'.tr,
      'iraq'.tr,
      'palestine'.tr,
      'morocco'.tr,
      'algeria'.tr,
      'tunisia'.tr,
      'libya'.tr,
      'sudan'.tr,
      'yemen'.tr,
      'mauritania'.tr,
      'somalia'.tr,
      'comoros'.tr,
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DropdownButtonFormField<String>(
        initialValue: selectedCountry,
        dropdownColor: Colors.green.shade900,
        iconEnabledColor: Colors.white,
        style: const TextStyle(color: Colors.white, fontFamily: "cairo", fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: const Icon(Icons.flag, color: Colors.white),
          labelText: 'country'.tr,
          labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp, fontFamily: "cairo"),
        ),
        items: countries.map((String country) {
          return DropdownMenuItem<String>(
            value: country,
            child: Text(country),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
