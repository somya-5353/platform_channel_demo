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
          case "getMessage": result("This a text from native XCode")
          default: result(FlutterMethodNotImplemented)
          }
       })
    
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
