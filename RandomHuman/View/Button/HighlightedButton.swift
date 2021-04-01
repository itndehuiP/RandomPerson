//
//  HighlightedButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

@IBDesignable
class HighlightedButton: UIButton {

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
        self.backgroundColor = UIColor.alert?.withAlphaComponent(0.90)
        self.titleLabel?.font = .preferredFont(forTextStyle: .headline)
        self.titleLabel?.textColor = UIColor.constrast
        self.tintColor = UIColor.constrast
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 3
        self.layer.borderColor = UIColor.alert?.cgColor
    }

}
