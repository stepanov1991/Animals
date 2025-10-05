//
//  Font+Extensions.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI
import UIKit

fileprivate enum FontName: String {
    
    case basicRegular = "Basic-Regular"
}

extension Font {
    
    private static func getFont(_ name: FontName, size: CGFloat) -> Font {
        Font.custom(name.rawValue, size: size)
    }
    
    // MARK: - Styles
    static let categoryTitle = getFont(.basicRegular, size: 17)
    static let title = getFont(.basicRegular, size: 16)
    static let subtitle = getFont(.basicRegular, size: 12)
    static let fuctTitle = getFont(.basicRegular, size: 18)

}
