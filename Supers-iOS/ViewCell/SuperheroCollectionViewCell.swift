//
//  SuperheroCollectionViewCell.swift
//  Supers-iOS
//
//  Created by Mañanas on 27/5/25.
//

import UIKit

class SuperheroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var view: UIView!
    
        func render (superhero: Superhero) {
            nameLabel.text = superhero.name
            avatarImageView.loadFrom(url: superhero.image.url)
            
            nameLabel.backgroundColor = UIColor(named: superhero.biography.alignment!)
        }

        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
            
            view.layer.cornerRadius = 16
            view.layer.masksToBounds = true
            view.layer.shadowColor = UIColor.blue.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 2)
            view.layer.shadowOpacity = 0.25
            view.layer.shadowRadius = 4
             
        }
             

       
            // Configure the view for the selected state
        

    }
