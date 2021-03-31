//
//  PersonCell.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit
import SDWebImage

class PersonCell: UITableViewCell {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var thumbnailImageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    
    var person: Person?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    private func configureView() {
        self.backView.layer.cornerRadius = 5
        self.backView.layer.borderWidth = 2
        let happyColor = UIColor.randomHappyColor(quantity: 4)
        self.backView.layer.borderColor = happyColor?.cgColor
        self.backView.backgroundColor = happyColor?.withAlphaComponent(0.60)
    }

    func set(_ person: Person) {
        self.person = person
        nameLabel.text = person.fullName
        ageLabel.text = person.ageDescription
        natLabel.text = person.nationalityDescription
        let placeholderImage = UIImage(systemName: "person.fill")
        imageView?.sd_setImage(with: person.thumbnailURL, placeholderImage: placeholderImage)
    }
}
