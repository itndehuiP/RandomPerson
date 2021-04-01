//
//  LoaderView.swift
//  RandomHuman
//
//  Created by Guerson Perez on 01/04/21.
//

import UIKit

@IBDesignable
class LoaderView: UIView, NibLoadable {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupFromNib()
        configureView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupFromNib()
        configureView()
    }
    
    private func configureView() {
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = UIColor.alert
        activityIndicator.style = .large
    }
}
