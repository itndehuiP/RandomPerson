//
//  HomeMainCard.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

@IBDesignable
class HomeMainCard: UIView, NibLoadable {
    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var welcomeLabel: TitleLabel!
    @IBOutlet private weak var quoteLabel: DescriptiveLabel!
    
    private let quoteGenerator = DiversityQuoteGenerator()
    
    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        specifiInit()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        setupFromNib()
        specifiInit()
    }

    private func specifiInit(){
        backView.layer.cornerRadius = 10.0
        backView.backgroundColor = UIColor.secondHighlight
        welcomeLabel.text = "Welcome"
        quoteLabel.text = quoteGenerator.quote
        quoteLabel.adjustsFontSizeToFitWidth = true
        quoteLabel.minimumScaleFactor = 0.8
    }
}
