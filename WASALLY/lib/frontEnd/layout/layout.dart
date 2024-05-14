import 'package:flutter/material.dart';
import 'package:Wasally/frontEnd/models/user_model.dart';
import 'package:Wasally/frontEnd/screens/help_screen.dart';
import 'package:Wasally/frontEnd/screens/history.dart';
import 'package:Wasally/frontEnd/screens/new_order.dart';
import 'package:Wasally/frontEnd/screens/setting.dart';

class LayoutScreen extends StatefulWidget {
  static const String routeName = 'layout';
  final user_model? loggedUser; // Define loggedUser property

  const LayoutScreen({Key? key, this.loggedUser}) : super(key: key);

  @override
  State<LayoutScreen> createState() => LayoutScreenState();
}

class LayoutScreenState extends State<LayoutScreen> {
  int currentIndex = 0;
  List<BottomNavigationBarItem>? bottomsNavBar;
  List<Widget>? screens;

  @override
  void initState() {
    super.initState();

    bottomsNavBar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.add),
        label: "New_Order",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.help_center),
        label: "Help Center",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.history),
        label: "History",
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: "Setting",
      ),
    ];

    screens = [
      const NewOrderScreen(),
      TopicsPage(),
      const history(),
      SettingScreen(
          loggedUser: widget.loggedUser), // Access loggedUser from widget
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
