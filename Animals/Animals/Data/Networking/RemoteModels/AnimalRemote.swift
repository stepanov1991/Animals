//
//  AnimalRemote.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

import Foundation

struct AnimalRemote: Codable {
    let title: String?
    let description: String?
    let image: String?
    let order: Int?
    let status: PaidStatusRemote?
    let content: [ContentRemote?]?
}
  
