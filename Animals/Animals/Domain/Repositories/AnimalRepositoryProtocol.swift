//
//  AnimalRepositoryProtocol.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

protocol AnimalRepositoryProtocol: AnyObject {
    func getAnimalsList() async throws -> [AnimalModel?]?
}
