// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 236, 108),
    );
  }
}