//
//  String+Extensions.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import Foundation

extension String {
    var toURL: URL? { URL(string: self) }
}
