import 'package:arhant/screens/Loginpage.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomNavigation.dart';

class Vendorspage extends StatefulWidget {
  const Vendorspage({super.key});

  @override
  State<Vendorspage> createState() => _VendorspageState();
}

class _VendorspageState extends State<Vendorspage> {
  String searchText = '';
  String? selectedStatus;
  String? selectedCity;
  String? selectedVendorType;

  List<Map<String, String>> filteredVendors = vendorData;

  @override
  void initState() {
    super.initState();
    filteredVendors = vendorData;
  }

  void applyFilters() {
    setState(() {
      filteredVendors = vendorData.where((vendor) {
        final matchesSearch = vendor['name']!
            .toLowerCase()
            .contains(searchText.toLowerCase());

        final matchesStatus =
        selectedStatus == null || selectedStatus == 'All'
            ? true
            : vendor['status'] == selectedStatus;

        final matchesCity =
        selectedCity == null || selectedCity == 'All'
            ? true
            : vendor['location'] == selectedCity;

        final matchesType =
        selectedVendorType == null || selectedVendorType == 'All'
            ? true
            : vendor['type'] == selectedVendorType;

        return matchesSearch && matchesStatus && matchesCity && matchesType;
      }).toList();
    });
  }


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
          'Vendors',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, size: 26, color: Colors.black),
            onPressed: () {
              // TODO: Add new vendor logic
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
        padding: const EdgeInsets.only(top: 2.0, left: 5, right: 5),
        child: Column(
          children: [
            // Search bar
            Container(
              width: double.infinity,
              height: 72,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F2F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search, color: Colors.blue, size: 24),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          searchText = value;
                          applyFilters();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Search vendor company',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Dropdowns Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          hint: const Center(child: Text("Status", style: TextStyle(fontSize: 13))),
                          value: selectedStatus,
                          isExpanded: true,
                          items: ['All','Active', 'Inactive']

                              .map((e) => DropdownMenuItem(value: e, child: Center(child: Text(e,style: TextStyle(fontSize: 12),))))
                              .toList(),
                          onChanged: (value) {
                            selectedStatus = value;
                            applyFilters();
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          hint: const Center(child: Text("City/State", style: TextStyle(fontSize: 13))),
                          value: selectedCity,
                          isExpanded: true,
                          items: ['All','Mumbai', 'Pune', 'Delhi', 'Bangalore', 'Chennai']
                              .map((e) => DropdownMenuItem(value: e, child: Center(child: Text(e,style: TextStyle(fontSize: 12),))))
                              .toList(),
                          onChanged: (value) {
                            selectedCity = value;
                            applyFilters();
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F2F5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          hint: const Center(child: Text("Vendor Type", style: TextStyle(fontSize: 13))),
                          value: selectedVendorType,
                          isExpanded: true,
                          items: ['All','Retail', 'Wholesale']
                              .map((e) => DropdownMenuItem(value: e, child: Center(child: Text(e,style: TextStyle(fontSize: 12),))))
                              .toList(),
                          onChanged: (value) {
                            selectedVendorType = value;
                            applyFilters();
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Scrollable Filtered Vendor List
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                  child: Column(
                    children: List.generate(filteredVendors.length, (index) {
                      final vendor = filteredVendors[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    vendor['name']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/images/phoneicon.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ],
                            ),
                            Row(children: [const Text('Phone: '), Expanded(child: Text(vendor['phone'] ?? ''))]),
                            const SizedBox(height: 2),
                            Row(children: [const Text('Email: '), Expanded(child: Text(vendor['email'] ?? ''))]),
                            const SizedBox(height: 2),
                            Row(children: [const Text('Location: '), Expanded(child: Text(vendor['location'] ?? ''))]),
                            const SizedBox(height: 2),
                            Row(children: [const Text('Contact: '), Expanded(child: Text(vendor['contact'] ?? ''))]),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 2, context: context),
    );
  }
}

// Dummy Vendor List
final List<Map<String, String>> vendorData = [
  {
    'name': 'FreshMart Pvt. Ltd.',
    'phone': '9823456789',
    'email': 'info@freshmart.com',
    'location': 'Mumbai',
    'contact': 'Rajesh Kumar'
  },
  {
    'name': 'HealthyFoods Co.',
    'phone': '9922334455',
    'email': 'contact@healthyfoods.com',
    'location': 'Pune',
    'contact': 'Anita Desai'
  },
  {
    'name': 'GreenLeaf Organics',
    'phone': '9876543210',
    'email': 'hello@greenleaf.com',
    'location': 'Delhi',
    'contact': 'Mehul Shah'
  },
  {
    'name': 'Daily Essentials',
    'phone': '9087654321',
    'email': 'support@dailyessentials.in',
    'location': 'Bangalore',
    'contact': 'Sneha Reddy'
  },
  {
    'name': 'Kitchen King Supplies',
    'phone': '9012345678',
    'email': 'sales@kitchenking.com',
    'location': 'Chennai',
    'contact': 'Vikram Chauhan'
  },
];
