//
//  UseCaseAssembly.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation
import Swinject

final class UseCaseAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AnimalUseCaseProtocol.self) { _ in AnimalUseCase() }
    }
}
