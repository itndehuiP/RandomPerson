//
//  QuestionMarkImage.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import SwiftUI

struct QuestionMarkImage: View {
    let size: CGSize
    
    var body: some View {
        ResizableSystemImage(systemImageName: "questionmark.circle.fill",
                             size: size,
                             color: .alert)
    }
}


struct QuestionMarkImage_Previews: PreviewProvider {
    static var previews: some View {
        QuestionMarkImage(size: CGSize(width: 100, height: 100))
    }
}
