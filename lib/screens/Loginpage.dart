import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  int selectedIndex = 0; // Set index for Login/Home

  void onTabTapped(int index) {
    // Handle tab navigation logic
    setState(() {
      selectedIndex = index;
    });

    // Example: Navigate based on index
    // You can replace this with actual page navigation
    if (index == 0) {
      // Already on Login
    } else if (index == 1) {
      // Navigate to Stocks page
    } else if (index == 2) {
      // Navigate to Vendors
    } else if (index == 3) {
      // Navigate to Attendance
    } else if (index == 4) {
      // Navigate to Profile
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(color: Color(0xFFE3E6EA), thickness: 1, height: 1),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: "Username or Phone Number",
                    hintStyle: const TextStyle(color: Color(0xFF666666)),
                    filled: true,
                    fillColor: const Color(0xFFF3F4F6),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Color(0xFF666666)),
                    filled: true,
                    fillColor: const Color(0xFFF3F4F6),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Colors.blue.shade600,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Divider(color: Color(0xFFE3E6EA), height: 1),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your login logic
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(46),
                backgroundColor: Colors.blue.shade600,
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 4,
                shadowColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Save Changes",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: 0,
        context: context,
      ),
    );
  }
}