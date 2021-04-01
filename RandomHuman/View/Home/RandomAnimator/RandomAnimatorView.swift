//
//  RandomAnimatorView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import SwiftUI

struct RandomAnimatorView: View {
    private let size = CGSize(width: 200, height: 200)
    let value: Int
    let onContinue: IntHandler
    private let duration = 2.0
    @State private var degrees: Double = 0.0
    @State private var circleVisible = false
    @State private var imageVisible = true
    
    var body: some View {
        ZStack {
            topText
            if circleVisible {
                valueCircleView
                continueButton
            }
            if imageVisible {
                questionMark
            }
        }
        .onAppear() {
            self.onApperance()
        }
    }
}

extension RandomAnimatorView {
    private var topText: some View {
        Text("Discoveries for today")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.alert)
            .offset(x: 0, y: -(1.2 * size.height))
    }
    
    private var questionMark: some View {
        QuestionMarkImage(size: size)
            .rotation3DEffect(.degrees(degrees), axis: (x: 0, y: 1, z: 0))
            .animation(Animation.easeOut(duration: duration).speed(1))
            .transition(.scale)
    }
    
    private var valueCircleView: some View {
        ZStack {
            circleView
            titleView
        }
        .animation(.linear)
        .transition(.scale)
        .onAppear() {
            self.imageVisible = false
        }
    }
        
    private var circleView: some View {
        Circle()
            .fill(Color.alert)
            .frame(width: size.width, height: size.height, alignment: .center)
    }
    
    private var titleView: some View {
        Text("\(value)")
            .font(Font.system(size: 60))
            .fontWeight(.bold)
            .foregroundColor(.theme)
    }
    
    private var continueButton: some View {
        StyledButton(style: .normal, title: "Continue") {
            onContinue?(value)
        }
        .offset(x: 0, y:  (1.2 * size.height))
    }
}

extension RandomAnimatorView {
    private func onApperance() {
        self.degrees += 1080
        DispatchQueue.main.asyncAfter(deadline: .now() + duration - 0.05) {
            circleVisible = true
        }
    }
}
