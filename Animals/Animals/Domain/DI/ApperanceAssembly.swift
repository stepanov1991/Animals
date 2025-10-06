//
//  ApperanceAssembly.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import Foundation
import Swinject

final class ApperanceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Theme.self) { _ in Theme() }
        .inObjectScope(.container)
        container.register(AppConfig.self) { _ in AppConfig() }
            .inObjectScope(.container)
    }
}
