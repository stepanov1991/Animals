//
//  ServiceAssembly.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation
import Swinject

final class ServiceAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AnimalServiceProtocol.self) { _ in AnimalService() }
    }
}
