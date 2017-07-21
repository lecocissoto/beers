//
//  BeerCVCell.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/21/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import UIKit
import Kingfisher

class BeerCVCell: UICollectionViewCell {
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var abvLbl: UILabel!
    
    func configureCell(with beer: Beer){
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(with: beer.imageURL)
        nameLbl.text = beer.name
        abvLbl.text  = "ABV: \(beer.abv)%"
    }
}
