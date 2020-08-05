//
//  DetailViewController.swift
//  TestRickAndMortyAlamofire
//
//  Created by Александр Бехтер on 29.07.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var backgroundColorView: UIView!
    @IBOutlet weak var photoImageView: ImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var character: Result!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        setupLabels()
        
        backgroundColorView.customViewForBackground()
        photoImageView.customViewForBackground()
        
        photoImageView.fetchImage(from: character.image)
    }
    
    private func setupLabels() {
        nameLabel.text = "My name is \(character.name)"
        statusLabel.text = "Status - \(character.status)"
        speciesLabel.text = "Species - \(character.species)"
        genderLabel.text = "Gender - \(character.gender)"
        originLabel.text = "Origin - \(character.origin.name)"
        locationLabel.text = "Location - \(character.location.name)"
    }
}

extension UIView {
        func customViewForBackground() {
            self.layer.cornerRadius = self.frame.size.height / 20
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5
            self.layer.shadowOffset = CGSize(width: 1, height: 5)
            self.layer.shadowColor = UIColor.black.cgColor
            
        }
}
