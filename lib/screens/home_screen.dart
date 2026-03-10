import 'package:flutter/material.dart';
import '../widgets/featured_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          "اكتشف فلكس يمن",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        const FeaturedCard(
          title: "🏛️ عقارات فاخرة",
          subtitle: "أفضل الفلل في صنعاء",
          icon: Icons.domain,
          color: Colors.orange,
        ),
        const FeaturedCard(
          title: "🚗 سيارات حديثة",
          subtitle: "عروض معرض فلكس",
          icon: Icons.directions_car_filled,
          color: Colors.blue,
        ),
        const FeaturedCard(
          title: "📱 إلكترونيات",
          subtitle: "أحدث الأجهزة الذكية",
          icon: Icons.phone_iphone,
          color: Colors.purple,
        ),
      ],
    );
  }
}
