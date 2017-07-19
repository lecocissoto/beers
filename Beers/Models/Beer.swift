//
//  Beer.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/18/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

struct Beer {
    // Properties
    var name: String
    var abv: Float
    var imageURL: URL
    var tagline: String
    var ibu: Float
    var description: String
    
    // This will be very different in Swift 4, when JSON serialization will be easier than that;
    // Json serialization keys
    enum JSONKeys: String{
        case imageUrl    = "image_url"
        case name        = "name"
        case abv         = "abv"
        case tagline     = "tagline"
        case ibu         = "ibu"
        case description = "description"
    }
    
    init(with dictionary: Dictionary<String, Any>){
        name        = dictionary[JSONKeys.name.rawValue] as? String ?? ""
        abv         = dictionary[JSONKeys.abv.rawValue] as? Float ?? 0.0
        tagline     = dictionary[JSONKeys.tagline.rawValue] as? String ?? ""
        ibu         = dictionary[JSONKeys.ibu.rawValue] as? Float ?? 0.0
        description = dictionary[JSONKeys.description.rawValue] as? String ?? ""
        
        let stringUrl = dictionary[JSONKeys.imageUrl.rawValue] as? String ?? ""
        imageURL = URL(string: stringUrl)! // one little cat died because of this
    }
}
