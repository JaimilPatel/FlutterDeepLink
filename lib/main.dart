import 'package:flutter/material.dart';
import 'package:flutterdeeplink/utils/common_methods.dart';

void main() {
  runApp(FlutterDeepLink());
}

class FlutterDeepLink extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Link With Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: navigateToNextScreen(),
    );
  }
}
