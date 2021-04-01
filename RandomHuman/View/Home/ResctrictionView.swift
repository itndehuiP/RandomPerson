//
//  ResctrictionView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import SwiftUI

struct ResctrictionView: View {
    private let size = CGSize(width: 200, height: 200)
    let onTapAction: VoidHandler
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack {
            clockImage
            topText
            acceptButton
        }
        .onAppear() {
            feedback.prepare()
            feedback.notificationOccurred(.error)
        }
    }
}

extension ResctrictionView {
    private var clockImage: some View {
        ResizableSystemImage(systemImageName: "clock.fill",
                             size: size,
                             color: .alert)
    }
    
    private var topText: some View {
        HStack {
            Text("Come back tomorrow to keep discovering")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .foregroundColor(.alert)
                .offset(x: 0, y: -(1.2 * size.height))
        }
        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 30))
    }
    
    private var acceptButton: some View {
        StyledButton(style: .normal,
                     title: "Ok",
                     action: onTapAction)
            .offset(x: 0, y: (1.2 * size.height))
    }
}
