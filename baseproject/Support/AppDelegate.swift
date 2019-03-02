//
//  AppDelegate.swift
//  baseproject
//
//  Created by Pazandish on 12/30/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

import UIKit
import Localize_Swift
/*import UserNotifications
*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate /*,MessagingDelegate*/ {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        App.shared.rootViewController = self.window?.rootViewController as? UINavigationController
        UINavigationBar.appearance().isTranslucent = false
        
        // setup static app language
//        Localize.setCurrentLanguage(Language.persian.rawValue)
        
        // direction of language based on language
        if Localize.currentLanguage() == Language.persian.rawValue {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        } else {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }
        
        
        do {
            InternetNetwork.reachability = try Reachability(hostname: "www.google.com")
            do {
                try InternetNetwork.reachability?.start()
            } catch let error as InternetNetwork.Error {
                print(error)
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }

        
        
//        //notification
//        UNUserNotificationCenter.current().delegate = self
//        let authOption: UNAuthorizationOptions = [.alert, .sound, .badge]
//        UNUserNotificationCenter.current().requestAuthorization(options: authOption, completionHandler: {_,_ in})
//        Messaging.messaging().delegate = self
//        application.registerForRemoteNotifications()
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    //MARK: - screen orientation
    var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return self.orientationLock
    }
    /*
    /////////////////FCM and messagin configuration////////////////////
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("Firebase registration token: \(fcmToken)")
        
        let dataDict: [String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        
        App.shared.fcmToken  = "IOS-\(fcmToken)"
        
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
        print("Device token: \(deviceToken)")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("didReceiveRemoteNotification Message Id: \(messageID)")
        }
        
        // Print full message.
        print("didReceiveRemoteNotification Full message",userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func applicationReceivedRemoteMessage(_ remoteMessage: MessagingRemoteMessage) {
        print("remoteMessage=>",remoteMessage.appData)
    }
    
    ///////////////////////////////////////////////////////////////////
    */
}
/*
/////////////////FCM and messagin configuration////////////////////
@available(iOS 10, *)
extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        
        // get notification body
        let userInfo = notification.request.content.userInfo
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("willPresent Message ID: \(messageID)")
        }
        
        guard let key: String = userInfo["type"] as? String else {
            return
        }
        
        guard let value: String = userInfo["value"] as? String else {
            return
        }
        
        switch key {
        case NotificationType.item.rawValue:
            print("key=> \(key), value=> \(value)")
        case NotificationType.url.rawValue:
            print("key=> \(key), value=> \(value)")
        case NotificationType.newChat.rawValue:
            print("key=> \(key), value=> \(value)")
        case NotificationType.newTicket.rawValue:
            print("key=> \(key), value=> \(value)")
        case NotificationType.popUp.rawValue:
            print("key=> \(key), value=> \(value)")
        default:
            break
        }
        
        // Change this to your preferred presentation option
        completionHandler([.alert, .sound, .badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // get notification body
        let userInfo = response.notification.request.content.userInfo
        
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("didReciveMessage ID: \(messageID)")
        }
        
        guard let key: String = userInfo["type"] as? String else {
            return
        }
        
        guard let value: String = userInfo["value"] as? String else {
            return
        }
        
        switch key {
        case NotificationType.item.rawValue:
            let vc = App.shared.rootViewController!.storyboard?.instantiateViewController(withIdentifier: "ProductItemCtrl") as! ProductItemCtrl
            vc.initWith(type: ProductItemCtrlInitType.withId(value),nodeCode: nil)
            App.shared.rootViewController!.pushViewController(vc, animated: true)
            
        case NotificationType.url.rawValue:
            let urlToken = SMGetTokenUrl()
            urlToken.url = value
            urlToken.os = "IOS"
            urlToken.version = App.shared.appVersion
            getClix(model: urlToken)
            
        case NotificationType.newChat.rawValue:
            let vc = App.shared.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
            vc.initWith(item: value)
            App.shared.rootViewController?.pushViewController(vc, animated: true)
            
        case NotificationType.newTicket.rawValue:
            let vc = App.shared.rootViewController?.storyboard?.instantiateViewController(withIdentifier: "ticketChatVC") as! ticketChatVC
            vc.ticketId = value
            App.shared.rootViewController?.pushViewController(vc, animated: true)
            
        case NotificationType.popUp.rawValue:
            MessageShow.messageView(msg: value, type: .info)
            
        default:
            break
        }
        
        completionHandler()
    }
} */
