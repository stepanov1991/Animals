//
//  AnimalListFeature.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct AnimalListFeature {
    @ObservableState
    struct State {
        var isLoading: Bool = false
        var isShowedComingSoonAlert: Bool = false
        var animalCategoriesList: [AnimalModel] = []
        var path = StackState<Path.State>()
        @Presents var alert: AlertState<Action.Alert>?
    }
    
    enum Action {
        case handleError(_ error: Error)
        case onAppear
        case animalCategoriesLoaded(animalCategories: [AnimalModel])
        case path(StackActionOf<Path>)
        case alert(PresentationAction<Alert>)
        case animalCategoryTapped(category: AnimalModel)
        case continueAfterAd(AnimalModel)
        
        enum Alert: Equatable {
            case wathcAdTapped(category: AnimalModel)
        }
    }
    
    @Reducer(state: .equatable)
    enum Path {
        case fact(FactFeature)
    }
    
    @Inject private var animalsUseCase: AnimalUseCaseProtocol
    
    public var body: some Reducer<State, Action> {
        Reduce { (state, action) in
            switch action {
            case .onAppear:
                state.isLoading = true
                return .run { send in
                    do {
                        let list = try await animalsUseCase.getAnimalsList()
                        await send(.animalCategoriesLoaded(animalCategories: list))
                    } catch {
                        await send(.handleError(error))
                    }
                }
            case let .animalCategoriesLoaded(animalCategories):
                state.animalCategoriesList = animalCategories.sorted(by: { $0.order < $1.order })
                state.isLoading = false
                return .none
            case let .handleError(error):
                guard let appError = error as? AppError else { return .none}
                let errorMessage = appError.localizedDescription
                logger.error(errorMessage)
                state.isLoading = false
                state.alert = AlertState {
                    TextState(errorMessage)
                } actions: {
                    ButtonState(role: .cancel) {
                        TextState("OK")
                    }
                }
                return .none
            case let .animalCategoryTapped(animalCategory):
                switch animalCategory.status {
                case .free:
                    state.path.append(.fact(FactFeature.State(animalCategory: animalCategory)))
                case .paid:
                    state.alert = AlertState {
                        TextState("Watch Ad to continue")
                    } actions: {
                        ButtonState(role: .cancel) {
                            TextState("Cancel")
                        }
                        ButtonState(action: .send(.wathcAdTapped(category: animalCategory))) {
                            TextState("Watch Ad")
                        }
                    }
                case .comingSoon:
                    state.alert = AlertState {
                        TextState("Coming Soon")
                    } actions: {
                        ButtonState(role: .cancel) {
                            TextState("OK")
                        }
                    }
                }
                return .none
            case .alert(.presented(.wathcAdTapped(let category))):
                state.isLoading = true
                return .run { send in
                    try await Task.sleep(nanoseconds: 2_000_000_000)
                    await send(.continueAfterAd(category))
                }
            case .continueAfterAd(let category):
                state.isLoading = false
                state.path.append(.fact(FactFeature.State(animalCategory: category)))
                return .none
            case .path:
                return .none
            case .alert:
                return .none
            }
        }
        .ifLet(\.$alert, action: \.alert)
        .forEach(\.path, action: \.path)
    }
}
