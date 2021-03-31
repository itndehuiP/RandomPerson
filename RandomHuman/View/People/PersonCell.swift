//
//  PersonCell.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet private weak var thumbnailImageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    
    var person: Person?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(_ person: Person) {
        self.person = person
        nameLabel.text = person.fullName
        ageLabel.text = person.ageDescription
        natLabel.text = person.nationalityDescription
    }
}
