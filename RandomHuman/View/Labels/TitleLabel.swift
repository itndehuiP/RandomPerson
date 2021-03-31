//
//  TitleLabel.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

@IBDesignable
class TitleLabel: UILabel {
    
    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        specifiInit()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        specifiInit()
    }

    private func specifiInit(){
        self.font = .preferredFont(forTextStyle: .title1)
        self.textColor = UIColor.constrast
        self.textAlignment = .center
    }
}
