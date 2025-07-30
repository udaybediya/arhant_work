import 'package:arhant/screens/Loginpage.dart';
import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';
import 'editprofilepage.dart';
import 'package:arhant/screens/editprofilepage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String name = 'Ethan Carter';
  String email = 'ethan.carter@example.com';
  String phone = '+1 (555) 123-4567';

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
          'Profile',
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
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profilepic.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(email, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(phone, style: const TextStyle(color: Colors.blue)),
              const SizedBox(width: 5),
              const Icon(Icons.circle, color: Colors.red, size: 10),
            ],
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: const Text('Edit Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
              trailing: Image.asset('assets/images/arrow.png', width: 25, height: 25),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      currentName: name,
                      currentEmail: email,
                      currentPhone: phone,
                    ),
                  ),
                );
                if (result != null) {
                  setState(() {
                    name = result['name'];
                    email = result['email'];
                    phone = result['phone'];
                  });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: const Text('Logout', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
              trailing: Image.asset('assets/images/arrow.png', width: 25, height: 25),
              onTap: () {},
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 4, context: context),
    );
  }
}
