//
//  PushNotificationTutorialApp.swift
//  PushNotificationTutorial
//
//  Created by Fatih Durmaz on 18.01.2024.
//

import SwiftUI
import UIKit

@main
struct PushNotificationTutorialApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    init(){
        let appareance = UINavigationBarAppearance()
        appareance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appareance
        UINavigationBar.appearance().scrollEdgeAppearance = appareance
    }
        
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data ) {
        let token = deviceToken.map {String(format: "%02.2hhx", $0)}.joined()
        print("Device Token: \(token)")
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }
    
}
