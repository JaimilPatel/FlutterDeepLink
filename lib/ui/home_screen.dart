import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutterdeeplink/ui/next_screen.dart';
import 'package:flutterdeeplink/utils/lieftcyle_watcher_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

StreamSubscription<Map> streamSubscriptionDeepLink;

class _HomeScreenState extends LifecycleWatcherState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    FlutterBranchSdk.validateSDKIntegration();
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscriptionDeepLink.cancel();
  }

  void _generateDeepLink() async {
    BranchUniversalObject buo = BranchUniversalObject(
        canonicalIdentifier: 'flutter/branch',
        title: 'Flutter Branch Plugin',
        imageUrl:
            'https://flutter.dev/assets/flutter-lockup-4cb0ee072ab312e59784d9fbf4fb7ad42688a7fdaea1270ccf6bbf4f34b7e03f.svg',
        contentDescription: 'Flutter Branch Description',
        keywords: ['Plugin', 'Branch', 'Flutter'],
        publiclyIndex: true,
        locallyIndex: true,
        contentMetadata: BranchContentMetaData()
          ..addCustomMetadata('custom_string', 'flutter deep link'));

    BranchLinkProperties lp = BranchLinkProperties(
        channel: 'facebook',
        feature: 'sharing',
        stage: 'new share',
        tags: ['one', 'two', 'three']);
    lp.addControlParam('url', 'http://www.google.com');
    lp.addControlParam('url2', 'http://flutter.dev');

    BranchResponse response =
        await FlutterBranchSdk.getShortUrl(buo: buo, linkProperties: lp);
    if (response.success) {
      print('Link generated: ${response.result}');
    } else {
      print('Error : ${response.errorCode} - ${response.errorMessage}');
    }
  }

  void listenDeepLink(BuildContext context) async {
    streamSubscriptionDeepLink = FlutterBranchSdk.initSession().listen((data) {
      if (data.containsKey("+clicked_branch_link") &&
          data["+clicked_branch_link"] == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NextScreen(
                      customString: data["custom_string"],
                    )));
      }
    }, onError: print);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: FlatButton(
          onPressed: () {
            _generateDeepLink();
          },
          child: Text("Branch Io"),
        ),
      ),
    ));
  }

  @override
  void onDetached() {
    // TODO: implement onDetached
  }

  @override
  void onInactive() {
    // TODO: implement onInactive
  }

  @override
  void onPaused() {
    // TODO: implement onPaused
  }

  @override
  void onResumed() {
    // TODO: implement onResumed
    Future.delayed(Duration.zero, () {
      listenDeepLink(context);
    });
  }
}
