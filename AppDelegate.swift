//
//  AppDelegate.swift
//  StyleCast
//
//  Created by Franczeska Ferariza on 4/8/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Add default trips if not already saved
        if UserDefaults.standard.data(forKey: "savedTrips") == nil {
            let defaultTrips = [
                Trip(city: "Italy", type: "City", weather: "70°F, Sunny", outfit: "T-shirt and jeans"),
                Trip(city: "Philippines", type: "Beach", weather: "88°F, Humid", outfit: "Tank top and shorts"),
                Trip(city: "Japan", type: "City", weather: "60°F, Cloudy", outfit: "Light jacket and pants")
            ]
            if let encoded = try? JSONEncoder().encode(defaultTrips) {
                UserDefaults.standard.set(encoded, forKey: "savedTrips")
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
