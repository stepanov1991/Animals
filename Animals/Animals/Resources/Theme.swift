//
//  Theme.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 02.10.2025.
//

import SwiftUI
import Combine

final class Theme: ObservableObject {
    
    var blackText: Color { Color(.blackText) }
    var whiteBG: Color { Color(.whiteBG) }
    var bg: Color { Color(.bg) }
    var subtitleText: Color { Color(.subtitleText) }
    var premiumBlue: Color { Color(.premiumBlue) }
    var factShadow: Color { Color(.factShadow) }
    var animalCellShadow: Color { Color(.animalCellShadow) }
    var commingSoonBlure: Color { Color(.commingSoonBlure) }

}
