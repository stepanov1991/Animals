//
//  PaidStatusModel.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 03.10.2025.
//

enum PaidStatusModel: String {
    case paid
    case free
    case comingSoon
    
    init?(from remote: PaidStatusRemote?) {
        guard let remote else { return nil }
        self = PaidStatusModel(rawValue: remote.rawValue) ?? .comingSoon
    }
}

extension PaidStatusModel: Equatable { } 
