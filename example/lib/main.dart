import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hc_batterylevel/batterylevel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _s = '';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String s;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = (await Batterylevel.getBatteryLevel).toString();

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    try{
      s = await Batterylevel.getBatteryLevel2("dart");
    } on PlatformException{
      s = '';
    }

    if (!mounted) {
      _platformVersion = platformVersion;
      return;
    }

    setState(() {
      _platformVersion = platformVersion;
      _s = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SizedBox.expand(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Running on: $_platformVersion\n',style: TextStyle(backgroundColor: Colors.blue)),
            Text('传给原生的参并返回: $_s\n'),
          ]
        ),
        ),
      ),
    );
  }
}
