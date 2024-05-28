import 'package:flutter/material.dart';

class KinhPhat extends StatefulWidget {
  const KinhPhat({super.key});

  @override
  State<KinhPhat> createState() => _KinhPhatState();
}

class _KinhPhatState extends State<KinhPhat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.7),
      body: Text('Page 2'),
    );
  }
}