//
//  RepositoryAssembly.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation
import Swinject

final class RepositoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AnimalRepositoryProtocol.self) { _ in AnimalRepository() }
    }
}
