//
//  PersonCell.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit

class PersonCell: UITableViewCell {

    @IBOutlet private weak var backView: UIView!
    @IBOutlet private weak var thumbnailImageV: PersonImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    weak var delegate: PersonCellDelegate?
    
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
        backView.layer.cornerRadius = 5
        backView.layer.borderWidth = 2
        let happyColor = UIColor.randomHappyColor(quantity: 4)
        backView.layer.borderColor = happyColor?.cgColor
        backView.backgroundColor = happyColor?.withAlphaComponent(0.60)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(onTapAction(sender:)))
        self.backView.addGestureRecognizer(gesture)
    }

    @objc func onTapAction(sender : UITapGestureRecognizer) {
        delegate?.onTap(person: person)
    }

    func set(_ person: Person) {
        self.person = person
        nameLabel.text = person.fullName
        ageLabel.text = person.ageDescription
        natLabel.text = person.nationalityDescription
        thumbnailImageV.setMedia(person.thumbnailURL)
    }
}
