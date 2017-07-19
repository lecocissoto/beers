//
//  Endpoints.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/19/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoints{
    
    // Type alias to make things readable
    typealias Endpoint = (url: String, method: HTTPMethod)
    
    static let beers: Endpoint = (url: "/beers", method: .get)
    
}
