import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.chat_bubble_outline, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            "💬 الدردشة والوساطة",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "لا توجد رسائل جديدة",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
