//
//  FactsView.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI
import ComposableArchitecture

struct FactsView: View {
    
    @Inject private var theme: Theme
    @Perception.Bindable var store: StoreOf<FactFeature>
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        WithPerceptionTracking {
            ZStack {
                theme.bg
                    .ignoresSafeArea()
                TabView(selection: $store.currentIndex.sending(\.selectTabIndex)) {
                    ForEach(Array(store.animalCategory.content.enumerated()), id: \.element.id) { index, content in
                        VStack {
                            FactTabView(content: content) {
                                store.send(.nextButtonTapped, animation: .default)
                            } previousAction: {
                                store.send(.previousButtonTapped, animation: .default)
                            }
                            .padding(.top, 60)
                            
                            Spacer()
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .navigationTitle(store.animalCategory.title)
            }
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: { dismiss() }) {
                        Image(.backIcon)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
