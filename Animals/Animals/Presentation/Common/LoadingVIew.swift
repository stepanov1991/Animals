//
//  LoadingVIew.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI

struct LoadingVIew: View {
    
    @Inject private var theme: Theme
    
    var body: some View {
        ZStack {
            theme.whiteBG.opacity(0.5)
                .ignoresSafeArea()
            
            ProgressView()
                .controlSize(.large)
        }
    }
}
