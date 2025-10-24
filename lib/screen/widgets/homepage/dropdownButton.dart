import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownButton extends StatelessWidget {
  final String text;

  const DropdownButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
