import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String location;

  const EventCard({
    super.key,
    required this.title,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// صورة الفعالية (Placeholder)
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Text("600 × 400", style: TextStyle(fontSize: 20, color: Colors.grey)),
            ),
          ),

          /// تفاصيل الفعالية
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 5),
                Row(
                  children: [
                  Icon(Iconsax.calendar_1, size: 16, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(date, style:  TextStyle(color: Colors.blueGrey)),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Iconsax.location, size: 16, color: Colors.blue),
                    const SizedBox(width: 5),
                    Text(location, style: const TextStyle(color: Colors.blueGrey)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
