import 'package:flutter/material.dart';
import 'package:new_one/Pages/dashboard/screens/dashboard.dart';

class BottomNavExample extends StatefulWidget {
  const BottomNavExample({super.key});

  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();
}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardScreen(),
    const SalesScreen(),
    const MarketingScreen(),
    const StocksScreen(),
    const HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Show selected screen
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFFFCDD2), // Light Red
        selectedItemColor: Colors.lightBlueAccent.shade700,
        unselectedItemColor: Colors.grey.shade600,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              // backgroundColor: Colors.amberAccent,
              icon: SizedBox(
                  width: 50, height: 25.0, child: Icon(size: 30.0, Icons.home)),
              label: 'Home'),
          BottomNavigationBarItem(
              // backgroundColor: Colors.blue,
              icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(size: 25.0, Icons.shopping_cart)),
              label: 'Sales'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(size: 30.0, Icons.campaign)),
              label: 'Marketing'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Icon(size: 25.0, Icons.inventory)),
              label: 'Stocks'),
          BottomNavigationBarItem(
              icon: SizedBox(
                  width: 80, height: 30, child: Icon(size: 25.0, Icons.help)),
              label: 'Help'),
        ],
      ),
    );
  }
}

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  // Future<void> setbatchno(int count) async {
  //   try {
  //     await FlutterDynamicIcon.setApplicationIconBadgeNumber(count);
  //   } on PlatformException {
  //     print("Exception: platform not supported");
  //   } catch (e) {
  //     print("Error: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sales')),
      body: Center(
          // child: ElevatedButton(
          //   onPressed: () async {
          //     // await setbatchno(5);
          //     log("batchnumber 5");
          //     // Add your logic here when the button is pressed
          //   },
          //   child: const Text("Set a Badge Number"),
          // ),
          ),
    );
  }
}

class MarketingScreen extends StatelessWidget {
  const MarketingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScreen('Marketing');
  }
}

class StocksScreen extends StatelessWidget {
  const StocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScreen('Stocks');
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildScreen('Help');
  }
}

// Common function to avoid code duplication
Widget _buildScreen(String title) {
  return Scaffold(
    body: Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
