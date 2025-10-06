//
//  ContentModel.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

struct ContentModel: Identifiable {
    let id = UUID()
    let fact: String
    let image: String?
    
    init(from remote: ContentRemote?) {
        self.fact = remote?.fact ?? "There are no fact"
        self.image = remote?.image
    }
    
}

extension ContentModel: Equatable { } 
