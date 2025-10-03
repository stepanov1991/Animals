//
//  AppDelegate.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        InjectSettings.resolver = DI.current.container
        return true
    }
    
}
