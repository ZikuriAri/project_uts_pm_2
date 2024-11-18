import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:project_uts_pm_2/category.dart';
import 'package:project_uts_pm_2/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:project_uts_pm_2/main.dart';
import 'package:project_uts_pm_2/populers.dart';
import 'package:project_uts_pm_2/setting.dart';
import 'package:project_uts_pm_2/welcome_screen.dart';

void main() {
  runApp(const MyApp ());
}

class NavBar extends StatelessWidget {
  const NavBar ({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
 final PageController _pageController = PageController();

@override
  void dispose() {
  _pageController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Dashboard(),
            Populers(),
            Setting(),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.apps),
            title: const Text('Home'),
            activeColor: const Color.fromARGB(255, 0, 0, 0),
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.trending_up_outlined),
              title: const Text('Populers'),
              activeColor: const Color.fromARGB(255, 0, 0, 0)
          ),
          BottomNavyBarItem(
              icon: const Icon(Icons.settings),
              title: const Text('Settings'),
              activeColor: const Color.fromARGB(255, 0, 0, 0)
          ),
        ],
      ),
    );
  }
}