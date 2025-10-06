//
//  AnimalService.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

protocol AnimalServiceProtocol: AnyObject {
    func getAnimalsList() async throws -> [AnimalRemote?]?
}

final class AnimalService: AnimalServiceProtocol {
    
    func getAnimalsList() async throws -> [AnimalRemote?]? {
        try await RequestManager.request(.animals(), resultType: [AnimalRemote?].self)
    }
    
}
