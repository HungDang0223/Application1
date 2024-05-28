import 'package:flutter/material.dart';

class LoiDay extends StatefulWidget {
  const LoiDay({super.key});

  @override
  State<LoiDay> createState() => _LoiDayState();
}

class _LoiDayState extends State<LoiDay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      body: Text('Page 3'),
    );
  }
}