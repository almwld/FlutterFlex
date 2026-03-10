import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppTheme.goldColor,
            child: const Icon(Icons.person, size: 60, color: Colors.black),
          ),
          const SizedBox(height: 20),
          const Text(
            "حسابي الشخصي",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "user@flexyemen.com",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
