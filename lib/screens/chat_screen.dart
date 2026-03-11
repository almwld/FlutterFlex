import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'أحمد محمد',
      'message': 'هل السيارة متوفرة؟',
      'time': '10:30',
      'unread': 2,
      'avatar': 'A',
      'online': true,
    },
    {
      'name': 'فلان الفلاني',
      'message': 'شكراً على التعامل',
      'time': '09:15',
      'unread': 0,
      'avatar': 'F',
      'online': false,
    },
    {
      'name': 'محمد علي',
      'message': 'كم السعر النهائي؟',
      'time': 'أمس',
      'unread': 1,
      'avatar': 'M',
      'online': true,
    },
    {
      'name': 'خالد عبدالله',
      'message': 'أريد معاينة العقار',
      'time': 'أمس',
      'unread': 0,
      'avatar': 'K',
      'online': false,
    },
    {
      'name': 'سعيد حسن',
      'message': 'تم التحويل بنجاح',
      'time': '23/03',
      'unread': 0,
      'avatar': 'S',
      'online': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // شريط البحث
          Container(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'البحث في المحادثات...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          
          // قائمة المحادثات
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                return ListTile(
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppTheme.goldColor,
                        child: Text(
                          msg['avatar'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (msg['online'])
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: Text(
                    msg['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    msg['message'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: msg['unread'] > 0 ? Colors.white : Colors.grey,
                      fontWeight: msg['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        msg['time'],
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      if (msg['unread'] > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.all(6),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            msg['unread'].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  onTap: () {
                    // فتح المحادثة
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // محادثة جديدة
        },
        backgroundColor: AppTheme.goldColor,
        child: const Icon(Icons.chat, color: Colors.black),
      ),
    );
  }
}
