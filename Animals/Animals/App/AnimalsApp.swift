//
//  AnimalsApp.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import SwiftUI

@main
struct AnimalsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AnimalListView()
        }
    }
}
