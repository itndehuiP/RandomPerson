//
//  StyledButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import SwiftUI

struct StyledButton: View {
    let style: ButtonStyle
    let title: String
    let action: VoidHandler
    
    var body: some View {
        Button(action: action ?? {}) {
            VStack {
                Text(title)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(backColor.opacity(0.90)))
        }
    }
}

extension StyledButton {
    private var textColor: Color {
        Color.theme
    }
    
    private var backColor: Color {
        switch style {
        case .highlighted:
            return Color.highlight
        case .normal:
            return Color.alert
        }
    }
}
