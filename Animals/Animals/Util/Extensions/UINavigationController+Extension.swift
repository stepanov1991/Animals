//
//  UINavigationController+Extension.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 06.10.2025.
//

import UIKit

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        navigationBar.backItem?.backButtonTitle = ""
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = .bg
        navigationBar.layer.shadowColor = UIColor.black.cgColor
        navigationBar.layer.shadowOpacity = 0.25
        navigationBar.layer.shadowOffset = CGSize(width: 0, height: 4)
        navigationBar.layer.shadowRadius = 3
        
    }
}

