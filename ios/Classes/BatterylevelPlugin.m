#import "BatterylevelPlugin.h"

@implementation BatterylevelPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"@hc_batterylevel"
            binaryMessenger:[registrar messenger]];
  BatterylevelPlugin* instance = [[BatterylevelPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getBatteryLevel" isEqualToString:call.method]) {
      [UIDevice currentDevice].batteryMonitoringEnabled = YES;
      double deviceLevel = [UIDevice currentDevice].batteryLevel;
      result(@1.0);
  } else if ([@"getBatteryLevel2" isEqualToString:call.method]) {
      result(call.arguments);
  } else{
    result(FlutterMethodNotImplemented);
  }
}

@end
