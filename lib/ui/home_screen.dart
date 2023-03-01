import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutterdeeplink/ui/next_screen.dart';
import 'package:flutterdeeplink/utils/console_utils.dart';
import 'package:flutterdeeplink/utils/constants/app_constants.dart';
import 'package:flutterdeeplink/utils/constants/dimens.dart';
import 'package:flutterdeeplink/utils/dialog_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

StreamSubscription<Map>? streamSubscriptionDeepLink;

class _HomeScreenState extends State<HomeScreen> {
  BranchUniversalObject? buo;
  BranchLinkProperties? lp;
  BranchResponse? response;

  @override
  void initState() {
    super.initState();
    FlutterBranchSdk.validateSDKIntegration();
    Future.delayed(Duration.zero, () {
      listenDeepLinkData(context);
    });
    initializeDeepLinkData();
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscriptionDeepLink?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppConstants.homeScreenAppBarTitle),
        ),
        body: SafeArea(
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                _generateDeepLink(context);
              },
              child: Text(
                AppConstants.branchIoDeepLink,
                style: TextStyle(color: Colors.white, fontSize: headerFontSize),
              ),
            ),
          ),
        ));
  }

  //To Listen Generated Branch IO Link And Get Data From It
  void listenDeepLinkData(BuildContext context) async {
    streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
      if (data.containsKey(AppConstants.clickedBranchLink) &&
          data[AppConstants.clickedBranchLink] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NextScreen(
                      customString: data[AppConstants.deepLinkTitle],
                    )));
      }
    }, onError: (error) {
      PlatformException platformException = error as PlatformException;
      ConsoleLogUtils.printLog(
          '${platformException.code} - ${platformException.message}');
    });
  }

  //To Setup Data For Generation Of Deep Link
  void initializeDeepLinkData() {
    buo = BranchUniversalObject(
      canonicalIdentifier: AppConstants.branchIoCanonicalIdentifier,
      contentMetadata: BranchContentMetaData()
        ..addCustomMetadata(
            AppConstants.deepLinkTitle, AppConstants.deepLinkData),
    );
    FlutterBranchSdk.registerView(buo: buo!);

    lp = BranchLinkProperties();
    lp?.addControlParam(AppConstants.controlParamsKey, '1');
  }

  //To Generate Deep Link For Branch Io
  void _generateDeepLink(BuildContext context) async {
    BranchResponse response =
        await FlutterBranchSdk.getShortUrl(buo: buo!, linkProperties: lp!);
    if (response.success) {
      print(response.result);
      ToastUtils.displayToast("${response.result}");
    } else {
      ConsoleLogUtils.printLog(
          '${response.errorCode} - ${response.errorMessage}');
    }
  }
}
