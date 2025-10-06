//
//  AnimalRepository.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

final class AnimalRepository: AnimalRepositoryProtocol {
    
    @Inject private var animalService: AnimalServiceProtocol

    func getAnimalsList() async throws -> [AnimalModel?]? {
        try await animalService.getAnimalsList()?.map({AnimalModel(from: $0)})
    }
}
