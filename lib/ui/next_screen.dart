import 'package:flutter/material.dart';

class NextScreen extends StatefulWidget {
  final String customString;
  NextScreen({this.customString});
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.customString),
      ),
    );
  }
}
