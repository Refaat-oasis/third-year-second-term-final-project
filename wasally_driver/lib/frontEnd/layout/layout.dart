// ignore_for_file: use_key_in_widget_constructors


import 'package:flutter/material.dart';
import 'package:wasaalydriver/frontEnd/screens/delivery_home.dart';
import 'package:wasaalydriver/frontEnd/screens/history.dart';
import 'package:wasaalydriver/frontEnd/screens/setting.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen();

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;

  List<BottomNavigationBarItem>? bottomsNavBar;

  List<Widget>? screens;

  @override
  void initState() {
    super.initState();

    bottomsNavBar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.square_outlined),
        label: "Orders",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.chat),
        label: "Chat",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Setting",
      ),
    ];

    screens = [
      const DeliveryHome(),
      history(),
      SettingScreen(),
    ];
  }

  void changeBottomScreen(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: bottomsNavBar!,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          changeBottomScreen(value);
        },
      ),
      body: screens?[currentIndex],
    );
  }
}
