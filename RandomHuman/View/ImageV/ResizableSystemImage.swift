//
//  ResizableSystemImage.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import SwiftUI

struct ResizableSystemImage: View {
    let systemImageName: String
    let size: CGSize
    let color: Color
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height, alignment: .center)
            .foregroundColor(color)
    }
}

struct ResizableSystemImage_Previews: PreviewProvider {
    static var previews: some View {
        ResizableSystemImage(systemImageName: "questionmark.circle.fill", size: CGSize(width: 50, height: 50), color: .pink)
    }
}
