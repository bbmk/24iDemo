//
//  AppDelegate.swift
//  24iTest
//
//  Created by Bojan Angjeleski on 28.3.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var dataRepo:DataRepo?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UINavigationBar.appearance().customNavigationBar()
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

extension UINavigationBar {
    func customNavigationBar() {
        // color for button images, indicators and etc.
        self.tintColor = UIColor.systemYellow

        // color for background of navigation bar
        // but if you use larget titles, then in viewDidLoad must write
        // navigationController?.view.backgroundColor = // your color
        self.barTintColor = .systemYellow
    //    self.isTranslucent = false

        // for larget titles
      //  self.prefersLargeTitles = true

        // color for large title label
      //  self.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        // color for standard title label
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemYellow]

        // remove bottom line/shadow
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
    }
}

