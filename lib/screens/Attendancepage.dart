import 'package:arhant/screens/Loginpage.dart';
import 'package:flutter/material.dart';
import '../widgets/BottomNavigation.dart';

class Attendancepage extends StatefulWidget {
  const Attendancepage({super.key});

  @override
  State<Attendancepage> createState() => _AttendancepageState();
}

class _AttendancepageState extends State<Attendancepage> {
  int currentMonth = DateTime.now().month;
  int currentYear = DateTime.now().year;
  int today = DateTime.now().day;

  final List<String> _monthNames = [
    "",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  final Map<int, List<int>> holidayDates = {
    7: [10, 13], // July: 10 (Guru Purnima), 13 (Bhanu Jayanti)
  };

  void _goToPreviousMonth() {
    setState(() {
      if (currentMonth == 1) {
        currentMonth = 12;
        currentYear--;
      } else {
        currentMonth--;
      }
    });
  }

  void _goToNextMonth() {
    setState(() {
      if (currentMonth == 12) {
        currentMonth = 1;
        currentYear++;
      } else {
        currentMonth++;
      }
    });
  }

  List<Widget> _buildCalendarDays() {
    List<Widget> dayWidgets = [];
    int daysInMonth = DateUtils.getDaysInMonth(currentYear, currentMonth);
    int firstWeekday = DateTime(currentYear, currentMonth, 1).weekday % 7;

    for (int i = 0; i < firstWeekday; i++) {
      dayWidgets.add(const SizedBox());
    }

    for (int day = 1; day <= daysInMonth; day++) {
      final isToday = (day == today &&
          currentMonth == DateTime.now().month &&
          currentYear == DateTime.now().year);
      final isSunday = DateTime(currentYear, currentMonth, day).weekday == 7;
      final isHoliday = holidayDates[currentMonth]?.contains(day) ?? false;

      dayWidgets.add(
        Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isToday ? Colors.blue : Colors.transparent,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isToday
                  ? Colors.white
                  : (isSunday || isHoliday)
                  ? Colors.red
                  : Colors.black,
            ),
          ),
        ),
      );
    }

    return dayWidgets;
  }

  Widget _holidayItem(String title, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Row(
        children: [
          Image.asset('assets/images/calendericon.png', height: 22, width: 22),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(date, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _birthdayItem(String name, String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      child: Row(
        children: [
          Image.asset('assets/images/birthdayicon.png',
              height: 22, width: 22),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              Text(date, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _leaveItem(String range, String reason, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(range,
                style:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 4),
            Text(reason, style: const TextStyle(color: Colors.grey)),
          ]),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(6),
            child: Image.asset(imagePath, height: 22, width: 22),
          )
        ],
      ),
    );
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
          'Attendance',
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.chevron_left,
                            color: Colors.black),
                        onPressed: _goToPreviousMonth,
                      ),
                      Text(
                        '${_monthNames[currentMonth]} $currentYear',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chevron_right,
                            color: Colors.black),
                        onPressed: _goToNextMonth,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                        .map((e) => Expanded(
                      child: Center(
                        child: Text(
                          e,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                  const SizedBox(height: 4),
                  GridView.count(
                    crossAxisCount: 7,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _buildCalendarDays(),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.only(bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      "Upcoming Holidays",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _holidayItem("Guru Purnima", "10 July, 2025"),
                  _holidayItem("Bhanu Jayanti", "13 July, 2025"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      "Upcoming Birthdays",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  _birthdayItem("Bhavna Patil", "21 July, 2025"),
                  _birthdayItem("Parag Mistri", "24 July, 2025"),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Divider(thickness: 1),
                  ),
                  _leaveItem("Aug 5, 2025 - Aug 7, 2025",
                      "Medical Leave 3 Days", 'assets/images/unacceptsign_icon.png'),
                  _leaveItem("Aug 5, 2025 - Aug 7, 2025",
                      "Medical Leave 3 Days", 'assets/images/acceptsign_icon.png'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  child: const Text("Request Leave",
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(selectedIndex: 3, context: context),
    );
  }
}
