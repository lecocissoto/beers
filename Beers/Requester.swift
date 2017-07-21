//
//  Requester.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/18/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
import Alamofire

// This class is the base for all the request classes. In this case, work only for beers
class Requester {
    //Properties
    var env: String
    var version: String
    
    //Type Alias
    typealias SuccessCallback = (_ message: String, _ beers:[Beer])->()
    typealias FailureCallback = (_ error: BeerErrors, _ message: String)->()
    
    // Initialize variables
    init(env: String, version: String){
        self.env     = env
        self.version = version
    }
    
    //Just to compose the url and make this part testable
    func URLComposer(using endpoint: String)->String{
        let url = "\(env)\(version)\(endpoint)"
        print(url)
        return url
    }
}
