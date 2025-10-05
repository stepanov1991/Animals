//
//  AnimalsApp.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import SwiftUI
import ComposableArchitecture


@main
struct AnimalsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    static var animalListStore = Store(initialState: AnimalListFeature.State()) {
        AnimalListFeature()
    }

    var body: some Scene {
        WindowGroup {
            AnimalListView(store: Self.animalListStore)
        }
    }
}
