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
        var animalCategoriesList: [AnimalModel] = []
        var path = StackState<Path.State>()
    }
    
    enum Action {
        case animalCategoryTapped(category: AnimalModel)
        case handleError(_ error: Error)
        case onAppear
        case animalCategoriesLoaded(animalCategories: [AnimalModel])
        case path(StackActionOf<Path>)
        
        enum Alert {
            case showAd(id: String)
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
                logger.error(appError.localizedDescription)
                // TODO: Handle Error Alert
                state.isLoading = false
                return .none
            case let .animalCategoryTapped(animalCategory):
                switch animalCategory.status {
                case .free:
                    state.path.append(.fact(FactFeature.State(animalCategory: animalCategory)))
                case .paid:
                    // TODO: Handle paid
                    print("")
                case .comingSoon:
                    // TODO: Handle coming soon
                    print("")
                }
                return .none
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }
}
