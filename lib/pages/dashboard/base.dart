import 'package:dubspay/pages/accounts/profile.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dubspay/pages/dashboard/home_page.dart';
import 'package:dubspay/pages/cards/cardsWidget.dart';
import 'package:dubspay/pages/statistics/statics_screen.dart';

class MyBase extends StatefulWidget {
  const MyBase({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyBase> {
  int _currentIndex = 0; // Index of the currently selected tab.

  final List<Widget> _screens = [
   const HomePage(),
    const StaticsScreen(),
    const CardScreen(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: Colors.transparent,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.home),
            title: const Text("Home",style: TextStyle(fontFamily: 'Oregon'),),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.activity),
            title: const Text("Statistics",style: TextStyle(fontFamily: 'Oregon'),),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.card),
            title: const Text("Cards",style: TextStyle(fontFamily: 'Oregon'),),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Iconsax.user),
            title: const Text("Account",style: TextStyle(fontFamily: 'Oregon'),),
            unselectedColor: Colors.grey.shade700,
            selectedColor: Colors.black,
          ),
        ],
      ),

// Show the selected screen.

    );
  }
}


