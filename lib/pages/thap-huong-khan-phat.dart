import 'package:flutter/material.dart';

class ThapHuong extends StatefulWidget {
  const ThapHuong({super.key});

  @override
  State<ThapHuong> createState() => _ThapHuongState();
}

class _ThapHuongState extends State<ThapHuong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      body: Center(child: Text('Page 1'),)
    );
  }
}