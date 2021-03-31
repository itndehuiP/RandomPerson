//
//  CircleButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        specifiInit()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        specifiInit()
    }

//    override func layoutSubviews() {
//
//    }
    
    private func specifiInit(){
        self.backgroundColor = UIColor.randomHappyColor(quantity: 2)
        self.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        self.titleLabel?.textColor = UIColor.constrast
        self.tintColor = UIColor.constrast
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }

}

