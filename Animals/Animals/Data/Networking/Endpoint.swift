//
//  Endpoint.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import Foundation

struct Endpoint {
    @Inject private var config: AppConfig

    let path: String
}

extension Endpoint {
    // We still have to keep 'url' as an optional, since we're
    // dealing with dynamic components that could be invalid.
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = config.baseUrl
        components.path = path
        return components.url
    }
}

extension Endpoint {
    
    static func animals() -> Endpoint {
        .init(path: "/Promova/promova-test-task-iOS/main/animals.json")
    }
    

}
