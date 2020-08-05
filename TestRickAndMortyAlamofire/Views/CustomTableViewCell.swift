//
//  CustomTableViewCell.swift
//  TestRickAndMortyAlamofire
//
//  Created by Александр Бехтер on 29.07.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var backgroundCellView: UIView!
    @IBOutlet weak var photoImageView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        backgroundCellView.customViews()
        photoImageView.customViews()
        nameLabel.customViews()
    }
    
    func configure(with persons: Result) {
        nameLabel.text = persons.name
        photoImageView.fetchImage(from: persons.image)

    }
}

   extension UIView {
        func customViews() {
            self.layer.cornerRadius = self.frame.size.height / 4
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5
            self.layer.shadowOffset = CGSize(width: 1, height: 5)
            self.layer.shadowColor = UIColor.black.cgColor
            
        }
}

