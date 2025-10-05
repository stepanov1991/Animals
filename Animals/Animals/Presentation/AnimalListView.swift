//
//  ContentView.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import SwiftUI
import ComposableArchitecture

struct AnimalListView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            Task {
             let t = try await RequestManager.request(.animals(), resultType: [AnimalRemote?].self)
                print(t)
            }
        }
    }
}
