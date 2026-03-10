import 'package:flutter/material.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.map, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            "🗺️ خريطة اليمن الذكية",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "جاري تحميل الخريطة...",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
