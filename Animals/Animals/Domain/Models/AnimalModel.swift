//
//  AnimalModel.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

struct AnimalModel: Identifiable {
    let id = UUID()
    let title: String?
    let description: String?
    let image: String?
    let order: Int?
    let status: PaidStatusModel?
    let content: [ContentModel]
    
    init(from remote: AnimalRemote?) {
        self.title = remote?.title
        self.description = remote?.description
        self.image = remote?.image
        self.order = remote?.order
        self.status = PaidStatusModel(from: remote?.status)
        self.content = remote?.content?.compactMap({ContentModel(from: $0)}) ?? []
    }
}
