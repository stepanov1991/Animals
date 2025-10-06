//
//  DI.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import Foundation
import Swinject

final class DI {
    static let current = DI()
    var container = Container()
    let assembler: Assembler
    
    private init() {
        assembler = Assembler([
            ServiceAssembly(),
            RepositoryAssembly(),
            UseCaseAssembly(),
            ApperanceAssembly()
        ], container: container)
    }
}

extension Container: Resolver {}

