import 'package:arhant/screens/Stocksinfopage.dart';
import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';
import 'Loginpage.dart';

class Stockspage extends StatelessWidget {
  const Stockspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const Loginpage()),
              );
            }
          },
        ),
        title: const Text(
          'Stocks',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 26, color: Colors.black),
            onPressed: () {
              // TODO: Add new stock logic
            },
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Color(0xFFE3E6EA), thickness: 1, height: 1),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: const [
          StockCard(
            title: 'A4 Paper',
            gst: '12.00%',
            colorText: 'Blue',
            quantity: 25,
            total: 1028,
            status: 'In Stock',
            statusColor: Color(0xFFCCF5D3),
            statusTextColor: Color(0xFF34A853),
          ),
          StockCard(
            title: 'Punching Machine',
            gst: '21.00%',
            colorText: 'White',
            quantity: 50,
            total: 1300,
            status: 'In Stock',
            statusColor: Color(0xFFCCF5D3),
            statusTextColor: Color(0xFF34A853),
          ),
          StockCard(
            title: 'Calculator',
            gst: '14.00%',
            colorText: 'Black',
            quantity: 75,
            total: 3999,
            status: 'Out of Stock',
            statusColor: Color(0xFFFFE3E3),
            statusTextColor: Color(0xFFFF3B30),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigation(
        selectedIndex: 1,
        context: context,
      ),
    );
  }
}

class StockCard extends StatelessWidget {
  final String title;
  final String gst;
  final String colorText;
  final int quantity;
  final int total;
  final String status;
  final Color statusColor;
  final Color statusTextColor;

  const StockCard({
    super.key,
    required this.title,
    required this.gst,
    required this.colorText,
    required this.quantity,
    required this.total,
    required this.status,
    required this.statusColor,
    required this.statusTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Stocksinfopagepage(
              title: title,
              gst: gst,
              colorText: colorText,
              quantity: quantity,
              total: total,
              status: status,
            ),
          ),
        );
      },
      borderRadius: BorderRadius.circular(12),
      splashColor: Colors.grey.withOpacity(0.1), // light blue on tap
      highlightColor: Colors.grey.withOpacity(0.05), // optional
      child: Container(
        margin: const EdgeInsets.only(bottom: 12, left: 4, right: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(
                      color: statusTextColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'GST Percentage : $gst',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Color : $colorText',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Quantity : $quantity   ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Total : $total',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
