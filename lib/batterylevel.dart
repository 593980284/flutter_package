import 'dart:async';

import 'package:flutter/services.dart';

class Batterylevel {
  static const MethodChannel _channel =
      const MethodChannel('@hc_batterylevel');

  static Future<double> get getBatteryLevel async {
    final double version = await _channel.invokeMethod('getBatteryLevel');
    return version;
  }

   static Future<String> getBatteryLevel2(String string) async {
    final String version = await _channel.invokeMethod('getBatteryLevel2',string);
    return version;
  }
}
