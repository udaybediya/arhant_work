import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final BuildContext context;

  BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.context,
  }) : super(key: key);

  final List<String> labels = ["Home", "Stocks", "Vendors", "Attendance", "Profile"];
  final List<String> icons = ["home", "stocks", "vendors", "attendance", "profile"];
  final List<String> routes = ["/login", "/stocks", "/vendors", "/attendance", "/profile"];

  void _handleTap(int index) {
    if (index != selectedIndex) {
      Navigator.pushReplacementNamed(context, routes[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // ✅ Adjust total height here
      child: BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        currentIndex: selectedIndex,
        onTap: _handleTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedLabelStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600), // ✅ Adjust text
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        items: List.generate(icons.length, (index) {
          return BottomNavigationBarItem(
            icon: SizedBox(
              width: 26, // ✅ icon size
              height: 26,
              child: Image.asset(
                'assets/images/${icons[index]}.png',
                color: selectedIndex == index ? Colors.blue : Colors.black,
                fit: BoxFit.contain,
              ),
            ),
            label: labels[index],
          );
        }),
      ),
    );
  }
}
