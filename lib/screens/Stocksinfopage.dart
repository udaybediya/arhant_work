import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';
import 'Stockspage.dart';

class Stocksinfopagepage extends StatefulWidget {
  final String title;
  final String colorText;
  final String status;
  final String gst;
  final int quantity;
  final int total;

  const Stocksinfopagepage({
    super.key,
    required this.title,
    required this.colorText,
    required this.status,
    required this.gst,
    required this.quantity,
    required this.total,
  });

  @override
  State<Stocksinfopagepage> createState() => _StocksinfopagepageState();
}

class _StocksinfopagepageState extends State<Stocksinfopagepage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.status.toLowerCase() == 'in stock';

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
                MaterialPageRoute(builder: (context) => const Stockspage()),
              );
            }
          },
        ),
        title: const Text(
          'Product',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              'assets/images/editicon.png',
              width: 20,
              height: 20,
            ),
            onPressed: () {
              // TODO: Add edit logic
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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow('HSN Code', null),
                  _infoRow(
                    'Inactive',
                    Row(
                      children: [
                        Icon(
                          isActive ? Icons.check_box_rounded : Icons.cancel,
                          color: isActive ? Colors.grey : Colors.grey,
                          size: 18,
                        )
                      ],
                    ),
                  ),
                  _infoRow(
                    'Product Description',
                    Text(widget.title, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500)),
                  ),
                  _infoRow(
                    'Units',
                    const Text('PKT', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                  _infoRow(
                    'GST Percentage',
                    Text(widget.gst, style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  final labels = ['Stock Movement', 'Purchase History', 'Stock Adjustment', 'Link'];
                  final isSelected = selectedIndex == index;

                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : const Color(0xFF667085),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          labels[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getTitleForIndex(selectedIndex),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _getDataForIndex(selectedIndex).length,
                      itemBuilder: (context, index) {
                        final item = _getDataForIndex(selectedIndex)[index];
                        final isPositive = item['number'] >= 0;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item['date'],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF667085),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${isPositive ? '+' : ''}${item['number']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 1,
        context: context,
      ),
    );
  }

  Widget _infoRow(String label, Widget? rightWidget) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          rightWidget ?? const SizedBox(),
        ],
      ),
    );
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return 'Stock Movement History';
      case 1:
        return 'Purchase History';
      case 2:
        return 'Stock Adjustment History';
      case 3:
        return 'Linked Entries';
      default:
        return '';
    }
  }

  List<Map<String, dynamic>> _getDataForIndex(int index) {
    switch (index) {
      case 0:
        return [
          {'name': 'Purchase', 'date': '2025-07-15', 'number': 100},
          {'name': 'Sale', 'date': '2025-07-14', 'number': -50},
          {'name': 'Transfer', 'date': '2025-07-12', 'number': 200},
          {'name': 'Adjustment', 'date': '2025-07-14', 'number': -10},
        ];
      case 1:
        return [
          {'name': 'Purchase Order #A1', 'date': '2025-07-10', 'number': 80},
          {'name': 'Purchase Order #A2', 'date': '2025-07-12', 'number': 70},
        ];
      case 2:
        return [
          {'name': 'Manual Add', 'date': '2025-07-09', 'number': 30},
          {'name': 'Damaged Removal', 'date': '2025-07-10', 'number': -5},
        ];
      case 3:
        return [
          {'name': 'Linked Invoice #501', 'date': '2025-07-01', 'number': 1},
          {'name': 'Linked PO #200', 'date': '2025-07-02', 'number': 1},
        ];
      default:
        return [];
    }
  }
}
