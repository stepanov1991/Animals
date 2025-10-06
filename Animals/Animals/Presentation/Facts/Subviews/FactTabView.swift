//
//  FactTabView.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI

struct FactTabView: View {
    
    @Inject private var theme: Theme
    
    var content: ContentModel
    var nextAction: () -> Void
    var previousAction: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            AsyncImage(url: content.image?.toURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width - 50, height: 234)
                    .clipped()
            } placeholder: {
                ZStack {
                    Rectangle()
                        .fill(.gray.opacity(0.4))
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 234)
            }
            .frame(width: UIScreen.main.bounds.width - 50, height: 234)
            .padding(.top, 10)
            .padding(.horizontal, 10)
            
            Text(content.fact)
                .font(.fuctTitle)
                .foregroundStyle(theme.blackText)
                .padding(.top, 16)
                .padding(.horizontal, 10)
            Spacer()
            
            HStack {
                Button {
                    previousAction()
                } label: {
                    Image(.previousIcon)
                        .resizable()
                        .frame(width: 52, height: 52)
                }
                
                Spacer()
                
                Button {
                    nextAction()
                } label: {
                    Image(.nextIcon)
                        .resizable()
                        .frame(width: 52, height: 52)
                }
            }
            .padding(.top, 85)
            .padding(.bottom, 20)
            .padding(.horizontal, 22)
            
        }
        .background(theme.whiteBG)
        .cornerRadius(6)
        .shadow(color: theme.factShadow, radius: 60, y: 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 60)
        
    }
}

