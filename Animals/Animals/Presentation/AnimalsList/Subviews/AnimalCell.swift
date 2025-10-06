//
//  AnimalCell.swift
//  Animals
//
//  Created by Yevhenii Stepanov on 05.10.2025.
//

import SwiftUI

struct AnimalCell: View {
    
    @Inject private var theme: Theme
    var animalCategory: AnimalModel
    var onTap: () -> Void
    
    var body: some View {
        ZStack {
            HStack(spacing: 12) {

                AsyncImage(url: animalCategory.image?.toURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 121, height: 90)
                        .clipped()
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .fill(.gray.opacity(0.4))
                        ProgressView()
                    }
                        .frame(width: 121, height: 90)
                }
                .frame(width: 121, height: 90)
                .padding(.vertical, 5)
                .padding(.leading, 5)
                
                VStack(alignment: .leading, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(animalCategory.title)
                            .font(.cellTitle)
                            .foregroundStyle(theme.blackText)
                        
                        
                        Text(animalCategory.description)
                            .font(.cellSubtitle)
                            .foregroundStyle(theme.subtitleText)
                    }
                    .padding(.leading, 5)
                    
                    Spacer()
                    if animalCategory.status == .paid {
                        HStack(spacing: 4) {
                            Image(.lockIcon)
                                .resizable()
                                .frame(width: 10, height: 12)
                            Text("Premium")
                                .font(.categoryTitle)
                                .foregroundColor(theme.premiumBlue)
                        }
                    }
                }
                .padding(.vertical, 10)
                Spacer()
                if animalCategory.status == .comingSoon {
                    Image(.comingSoon)
                        .resizable()
                        .frame(width: 79, height: 63)
                        .rotationEffect(Angle(degrees: -45))
                        .padding(.trailing, 4)
                }
            }
            .background(theme.whiteBG)
            .cornerRadius(6)
            .addShadow(ifNeeded: animalCategory.status != .comingSoon)
            
            if animalCategory.status == .comingSoon {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(theme.commingSoonBlure)
            }
        }
        .onTapGesture {
            onTap()
        }
    }
}

private extension View {
    @ViewBuilder
    func addShadow(ifNeeded: Bool) -> some View {
        if ifNeeded {
            self.shadow(color: .animalCellShadow, radius: 2, y: 2)
        } else {
            self
        }
    }
}
