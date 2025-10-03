//
//  AnimalUseCase.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

protocol AnimalUseCaseProtocol: AnyObject {
    func getAnimalsList() async throws -> [AnimalModel]
}

final class AnimalUseCase: AnimalUseCaseProtocol {
    @Inject private var animalRepository: AnimalRepositoryProtocol
    
    func getAnimalsList() async throws -> [AnimalModel] {
        guard let result = try await animalRepository.getAnimalsList()?.compactMap({$0}), !result.isEmpty
        else {
            logger.debug(#function + " result is empty")
            return []
        }
        return result
    }
}
