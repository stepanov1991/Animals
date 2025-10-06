//
//  AnimalModel.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

struct AnimalModel: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let image: String?
    let order: Int
    var status: PaidStatusModel
    let content: [ContentModel]
    
    init(from remote: AnimalRemote?) {
        self.title = remote?.title ?? "There are no title"
        self.description = remote?.description ?? "There are no description"
        self.image = remote?.image
        self.order = remote?.order ?? 0
        self.status = PaidStatusModel(from: remote?.status) ?? .comingSoon
        self.content = remote?.content?.compactMap({ContentModel(from: $0)}) ?? []
    }
}

extension AnimalModel: Equatable { }
