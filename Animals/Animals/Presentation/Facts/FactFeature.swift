//
//  FactFeature.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct FactFeature {
    @ObservableState
    struct State: Equatable {
        let animalCategory: AnimalModel
        var currentIndex: Int = 0
    }
    
    enum Action {
        case previousButtonTapped
        case nextButtonTapped
        case selectTabIndex(Int)
    }
    
    public var body: some Reducer<State, Action> {
        Reduce { (state, action) in
            switch action {
            case .previousButtonTapped:
                guard state.currentIndex > 0 else { return .none }
                state.currentIndex -= 1
                return .none
            case .nextButtonTapped:
                guard state.currentIndex < state.animalCategory.content.count - 1  else { return .none }
                state.currentIndex += 1
                return .none
            case let .selectTabIndex(index):
                state.currentIndex = index
                return .none
            }
        }
    }
}
