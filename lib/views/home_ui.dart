import 'package:flutter/material.dart';
import 'package:flutter_money_tracking_app/views/money_balance_ui.dart';
import 'package:flutter_money_tracking_app/views/money_in_ui.dart';
import 'package:flutter_money_tracking_app/views/money_out_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;

  List<Widget> page = [MoneyInUi(), MoneyBalanceUi(), MoneyOutUi()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.arrowDownLong),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 50), label: ""),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.arrowUpLong),
            label: "",
          ),
        ],

        selectedItemColor: Color(0xff001f54),
        unselectedItemColor: Color(0xff1282a2),
      ),
      body: page[selectedIndex],
    );
  }
}
