import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double balance = 125000.00;
  final List<Map<String, dynamic>> transactions = [
    {
      'type': 'إيداع',
      'amount': 50000,
      'date': '2024-03-20',
      'time': '14:30',
      'status': 'مكتمل',
      'icon': Icons.arrow_downward,
      'color': Colors.green,
    },
    {
      'type': 'شراء',
      'amount': -15000,
      'date': '2024-03-18',
      'time': '10:15',
      'status': 'مكتمل',
      'icon': Icons.shopping_cart,
      'color': Colors.orange,
    },
    {
      'type': 'إيداع',
      'amount': 75000,
      'date': '2024-03-15',
      'time': '16:45',
      'status': 'مكتمل',
      'icon': Icons.arrow_downward,
      'color': Colors.green,
    },
    {
      'type': 'تحويل',
      'amount': -25000,
      'date': '2024-03-12',
      'time': '09:20',
      'status': 'مكتمل',
      'icon': Icons.send,
      'color': Colors.blue,
    },
    {
      'type': 'استرجاع',
      'amount': 15000,
      'date': '2024-03-10',
      'time': '11:00',
      'status': 'مكتمل',
      'icon': Icons.refresh,
      'color': Colors.purple,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // رأس الصفحة مع الرصيد
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.goldColor,
                    AppTheme.goldColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    const Text(
                      'رصيد المحفظة',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '${balance.toStringAsFixed(0)} ر.ي',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildActionButton(
                          'إيداع',
                          Icons.add,
                          () {},
                        ),
                        _buildActionButton(
                          'سحب',
                          Icons.remove,
                          () {},
                        ),
                        _buildActionButton(
                          'تحويل',
                          Icons.send,
                          () {},
                        ),
                        _buildActionButton(
                          'سجل',
                          Icons.history,
                          () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // الإحصائيات
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'إجمالي الإيداع',
                      '125,000',
                      Icons.arrow_downward,
                      Colors.green,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      'إجمالي الصرف',
                      '40,000',
                      Icons.arrow_upward,
                      Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // عنوان المعاملات
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'المعاملات الأخيرة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // قائمة المعاملات
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final tx = transactions[index];
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: tx['color'].withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      tx['icon'],
                      color: tx['color'],
                    ),
                  ),
                  title: Text(
                    tx['type'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${tx['date']} - ${tx['time']}',
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
                  trailing: Text(
                    '${tx['amount'] > 0 ? '+' : ''}${tx['amount'].toStringAsFixed(0)} ر.ي',
                    style: TextStyle(
                      color: tx['amount'] > 0 ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              },
              childCount: transactions.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon, VoidCallback onTap) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String amount, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '$amount ر.ي',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
