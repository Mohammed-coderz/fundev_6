import 'package:flutter/material.dart';
import 'package:untitled4/screens/drawar_screen.dart';
import 'package:untitled4/screens/grid_view_screen.dart';
import 'package:untitled4/screens/list_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    ListViewScreen(),
    GridViewScreen(),
    DrawarScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
        currentIndex: _selectedIndex,
        onTap: (index) {
          print("index = $index");
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home Screen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "search screen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "profile screen",
          ),
        ],
      ),
    );
  }
}
