import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
       let messageChannel = FlutterMethodChannel(name: "demo.flutter.dev/messageFromNative",
                                                 binaryMessenger: controller.binaryMessenger)
       messageChannel.setMethodCallHandler({
         (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
         switch (call.method) {
         case "getMessage": let sum = self.calculateSum(listOfNumbers: call.arguments as! [Int])
             result(sum)
          default: result(FlutterMethodNotImplemented)
          }
       })
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
  private func calculateSum(listOfNumbers: [Int]) -> Int {
      var sum = 0;
      listOfNumbers.forEach { (num) in
          sum = sum + num;
      }
      return sum;
  }

}
