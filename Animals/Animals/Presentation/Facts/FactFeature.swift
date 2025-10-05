//
//  FactsStore.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct FactsStore {
    @ObservableState
    struct State: Equatable {
        let animal: AnimalModel
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
                state.currentIndex -= 1
                return .none
            case .nextButtonTapped:
                state.currentIndex += 1
                return .none
            case let .selectTabIndex(index):
                state.currentIndex = index
                return .none
            }
        }
    }
}
