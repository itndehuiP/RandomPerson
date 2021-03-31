//
//  BarButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

class BarButton: UIButton {
    
    private var image: UIImage?
    private var titleR: String?
    private var style: ButtonStyle = .normal
    /// Init for integration by code
    override init(frame: CGRect) {
        super.init(frame: frame)
        specifiInit()
    }

    required init?(coder: NSCoder) { //For integration by IBOutlet
        super.init(coder: coder)
        specifiInit()
    }
    
    convenience init(item: NavigationBarItem) {
        var frame = CGRect(origin: .zero, size: CGSize(width: 30, height: 30))
        var img: UIImage?
        var title: String?
        if let systemName = item.systemIMgName, let image = UIImage(systemName: systemName) {
            img = image
        }
        if let titleR = item.title, !titleR.isEmpty {
            title = titleR
            if img != nil {
                frame = CGRect(origin: .zero, size: CGSize(width: 80, height: 30))
            }
        }
        self.init(frame: frame)
        self.image = img
        self.titleR = title
        self.style = item.style
        configureView()
    }
    
    private func specifiInit(){
        self.backgroundColor = UIColor.randomHappyColor(quantity: 2)
        self.titleLabel?.font = .preferredFont(forTextStyle: .title1)
        self.titleLabel?.textColor = UIColor.constrast
        self.tintColor = UIColor.constrast
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
    }
    
    private func configureView() {
        setTintColor(for: style)
        if let title = titleR {
            titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
            setTitleColor(UIColor.constrast, for: .normal)
            setTitle(title, for: .normal)
        }
        if let image = image {
            setImage(image, for: .normal)
        }
    }
    
}
