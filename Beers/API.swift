//
//  API.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/18/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

class API{
    
    var env: String
    var version : String
    
    public enum Enviroment: String{
        case production = "https://api.punkapi.com"
    }
    
    public enum Version: String{
        case v2 = "/v2"
    }
    
    init(env: Enviroment, version: Version) {
        self.env     = env.rawValue
        self.version = version.rawValue
    }
    
    // Creating a lazy var 
    fileprivate var _beerService: BeerRequester?
    open var beerService: BeerRequester {
        if _beerService == nil {
            _beerService = BeerRequester(env: env, version: version)
        }
        return _beerService!
    }
    
    
    
    
}
