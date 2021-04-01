//
//  PersonImageView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import UIKit
import SDWebImage

class PersonImageView: UIImageView {

    private var url: URL?
    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        configureView()
    }
    
    private func configureView() {
        loadImage()
    }

    func loadImage() {
        let placeholderImage = UIImage(systemName: "person.fill")
        sd_setImage(with: url, placeholderImage: placeholderImage)
    }
    
    func setMedia(_ url: URL?) {
        self.url = url
        loadImage()
    }
}
