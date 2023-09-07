import UIKit
import Flutter
import flutter_local_notifications
import FirebaseCore
import FirebaseMessaging


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    let gcmMessageIDKey = "gcm.Message_ID"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate

      FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)



      let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
      UNUserNotificationCenter.current().requestAuthorization(
        options: authOptions,
        completionHandler: { _, _ in }
      )

      application.registerForRemoteNotifications()
      Messaging.messaging().delegate = self


    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      print("Firebase registration token: \(String(describing: fcmToken))")

      let dataDict: [String: String] = ["token": fcmToken ?? ""]
      NotificationCenter.default.post(
        name: Notification.Name("FCMToken"),
        object: nil,
        userInfo: dataDict
      )
      // TODO: If necessary send token to application server.
      // Note: This callback is fired at each app startup and whenever a new token is generated.
    }

}