//
//  PersonCharacteristicView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

@IBDesignable
class PersonCharacteristicView: UIView, NibLoadable {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: DescriptiveLabel!
    
    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        specificInit()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        setupFromNib()
        specificInit()
    }
    
    private func specificInit() {
        descriptionLabel.changeAlignmet(.left)
        let currentText = descriptionLabel.text
        if currentText == "Label" {
            descriptionLabel.text = nil
        }
    }
    
    func setInfo(_ info: CharacteristicModel){
        if let systemImg = info.systemImgName {
            let image = UIImage(systemName: systemImg)
            imageView.tintColor = UIColor.alert
            imageView.image = image
        }
        if let description = info.valueDescripton {
            descriptionLabel.font = UIFont.preferredFont(forTextStyle: .headline)
            descriptionLabel.text = description
        }
    }
}
