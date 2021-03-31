//
//  RandomViewCell.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

class RandomRowCell: UITableViewCell {
    
    
    @IBOutlet private weak var firstButton: CircleButton!
    @IBOutlet weak var secondButton: CircleButton!
    @IBOutlet weak var thirdButton: CircleButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureView() {
        let title = "?"
        firstButton.setTitle(title, for: .normal)
        secondButton.setTitle(title, for: .normal)
        thirdButton.setTitle(title, for: .normal)
    }

}
