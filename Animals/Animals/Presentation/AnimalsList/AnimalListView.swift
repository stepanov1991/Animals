//
//  ContentView.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import SwiftUI
import ComposableArchitecture

struct AnimalListView: View {
    @Perception.Bindable var store: StoreOf<AnimalListFeature>
    @Inject private var theme: Theme
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                ZStack {
                    theme.bg
                        .ignoresSafeArea()
                    ScrollView {
                        LazyVStack(spacing: 16) {
                            ForEach(store.animalCategoriesList) { amimalCategory in
                                AnimalCell(animalCategory: amimalCategory) {
                                    store.send(.animalCategoryTapped(category: amimalCategory))
                                }
                            }
                        }
                        .padding(.top, 30)
                        .padding(.horizontal, 20)
                    }
                   if store.isLoading {
                        LoadingVIew()
                    }
                }
              
                .onAppear {
                    store.send(.onAppear)
                }
                .alert($store.scope(state: \.alert, action: \.alert))
            } destination: { store in
                switch store.case {
                case let .fact(factStore):
                    FactsView(store: factStore)
                }
            }
        }
    }
}
