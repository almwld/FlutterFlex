import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final List<Map<String, dynamic>> locations = [
    {'name': 'صنعاء', 'lat': 15.3694, 'lng': 44.1910, 'ads': 120},
    {'name': 'عدن', 'lat': 12.7855, 'lng': 45.0185, 'ads': 85},
    {'name': 'تعز', 'lat': 13.5795, 'lng': 44.0209, 'ads': 64},
    {'name': 'الحديدة', 'lat': 14.7979, 'lng': 42.9545, 'ads': 43},
    {'name': 'المكلا', 'lat': 14.5424, 'lng': 49.1259, 'ads': 32},
    {'name': 'إب', 'lat': 13.9667, 'lng': 44.1833, 'ads': 28},
    {'name': 'سيئون', 'lat': 15.9333, 'lng': 48.8000, 'ads': 21},
    {'name': 'ذمار', 'lat': 14.5500, 'lng': 44.4000, 'ads': 19},
  ];

  String selectedCategory = 'الكل';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خريطة وهمية (يمكن استبدالها بـ Google Maps)
          Container(
            color: Colors.grey[900],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 100,
                    color: AppTheme.goldColor.withOpacity(0.5),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    '🗺️ خريطة اليمن الذكية',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'جاري تحميل الخريطة...',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ),
          
          // فئات الإعلانات
          Positioned(
            top: 60,
            left: 16,
            right: 16,
            child: Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryChip('الكل', Icons.all_inclusive),
                  _buildCategoryChip('عقارات', Icons.home),
                  _buildCategoryChip('سيارات', Icons.directions_car),
                  _buildCategoryChip('إلكترونيات', Icons.phone_android),
                  _buildCategoryChip('وظائف', Icons.work),
                  _buildCategoryChip('خدمات', Icons.handyman),
                ],
              ),
            ),
          ),
          
          // قائمة المدن السفلية
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'المدن المتاحة',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: locations.length,
                      itemBuilder: (context, index) {
                        final loc = locations[index];
                        return Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 12),
                          child: Card(
                            color: Colors.grey[800],
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppTheme.goldColor,
                                    size: 32,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    loc['name'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${loc['ads']} إعلان',
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // زر الموقع الحالي
          Positioned(
            bottom: 220,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppTheme.goldColor,
              mini: true,
              child: const Icon(Icons.my_location, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    final isSelected = selectedCategory == label;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.black : Colors.white,
            ),
            const SizedBox(width: 4),
            Text(label),
          ],
        ),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            selectedCategory = label;
          });
        },
        selectedColor: AppTheme.goldColor,
        backgroundColor: Colors.grey[800],
        labelStyle: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
