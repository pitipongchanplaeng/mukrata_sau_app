// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mukrata_sau_app/views/about_ui.dart';
import 'package:mukrata_sau_app/views/calculate_pay_bill_ui.dart';
import 'package:mukrata_sau_app/views/menu_shop_ui.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({super.key});

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
//สร้างตัวแปรเก็บหน้าจอ (ui) ที่จะใช้กับ ButtomBar
List<Widget> _currentShow = [
  CalculatePayBill(),
  MenushopUI(),
  AboutUI(),
];

int _currentIndex  = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 77, 77),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          'อิ่มอร่อย BUFFET',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: ConvexAppBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        initialActiveIndex: _currentIndex,
        backgroundColor: Colors.deepOrange,
        items: [
          TabItem(
            icon: Icon(
              FontAwesomeIcons.moneyBill,
              color: Color.fromARGB(255, 1, 175, 1),
            ),
            title: 'คิดเงิน',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.home,
              color: Color.fromARGB(255, 255, 17, 0),
            ),
            title: 'Home',
          ),
          TabItem(
            icon: Icon(
              FontAwesomeIcons.star,
              color: Color.fromARGB(255, 250, 233, 0),
            ),
            title: 'เกี่ยวกับ',
          ),
        ],
      ),
      body: _currentShow[_currentIndex],
    );
  }
}
