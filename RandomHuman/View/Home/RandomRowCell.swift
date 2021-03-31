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
    weak var delegate: RandomRowDelegate?
    
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
        setActions()
    }

    private func setActions() {
        firstButton.addTarget(self, action: #selector(crateRandomNumber), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(crateRandomNumber), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(crateRandomNumber), for: .touchUpInside)
    }
    
    @objc private func crateRandomNumber() {
        let random = Int.random(in: 1..<50)
        delegate?.onButtonTapped(value: random)
    }
}
