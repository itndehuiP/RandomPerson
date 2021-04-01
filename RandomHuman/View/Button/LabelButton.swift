//
//  BarButton.swift
//  RandomHuman
//
//  Created by Guerson Perez on 31/03/21.
//

import Foundation
import UIKit

class LabelButton: UIButton {
    
    private var image: UIImage?
    private var titleR: String?
    private var style: ButtonStyle = .normal
    static let plainFrame = CGRect(origin: .zero, size: CGSize(width: 30, height: 30))
    static let compoundFrame = CGRect(origin: .zero, size: CGSize(width: 80, height: 30))
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
        let frame = LabelButton.calculateFrame(systemImgName: item.systemImgName, title: item.title)
        self.init(frame: frame)
        setValues(systemImgName: item.systemImgName, title: item.title, style: item.style)
    }
    
    convenience init(systemImgName: String?, title: String?, style: ButtonStyle) {
        let frame = LabelButton.calculateFrame(systemImgName: systemImgName, title: title)
        self.init(frame: frame)
        setValues(systemImgName: systemImgName, title: title, style: style)
    }
    
    private static func calculateFrame(systemImgName: String? , title: String?) -> CGRect {
        if !(title ?? "").isEmpty {
            if let imgName = systemImgName, UIImage(systemName: imgName) != nil {
                return LabelButton.compoundFrame
            }
            return LabelButton.plainFrame
        }
        return LabelButton.plainFrame
    }
    
    func setValues(systemImgName: String?, title: String?, style: ButtonStyle) {
        if let systemImgName = systemImgName, let img = UIImage(systemName: systemImgName) {
            self.image = img
        }
        self.titleR = title
        self.style = style
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
