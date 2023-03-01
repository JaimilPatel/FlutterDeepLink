import 'package:flutter/material.dart';
import 'package:flutterdeeplink/utils/constants/app_constants.dart';
import 'package:flutterdeeplink/utils/constants/dimens.dart';

class NextScreen extends StatefulWidget {
  final String? customString;
  NextScreen({this.customString});
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.nextScreenAppBarTitle),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppConstants.gettingData,
              style: TextStyle(fontSize: descriptionFontSize),
            ),
            Center(
              child: Text(
                "${widget.customString}",
                style:
                    TextStyle(fontSize: descriptionFontSize, color: Colors.red),
              ),
            )
          ],
        ),
      ),
    );
  }
}
