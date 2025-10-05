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
        guard let result = try await animalRepository.getAnimalsList()?.compactMap({$0}),
              !result.isEmpty
        else {
            logger.debug(#function + " result is empty")
            return []
        }
        
        return updateAnimalsStatusIfNeeded(list: result)
    }
    
    /// Updates the status of animals in the given list if needed.
    /// - Parameter list: Array of AnimalModel objects to be checked.
    /// - Returns: A new array of AnimalModel where items with empty or nil `content`
    ///            are marked with status `.comingSoon`.
    private func updateAnimalsStatusIfNeeded(list: [AnimalModel]) -> [AnimalModel] {
        return list.map { animalModel in
            var updatedAnimal = animalModel
            if updatedAnimal.content.isEmpty {
                updatedAnimal.status = .comingSoon
            }
            return updatedAnimal
        }
    }
}
