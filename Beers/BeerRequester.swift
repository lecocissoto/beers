//
//  BeerRequester.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/19/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation
import Alamofire

class BeerRequester: Requester{
    
    func beers(page: Int = 1, success: @escaping SuccessCallback, failure: @escaping FailureCallback){
        Alamofire.request(URLComposer(using: Endpoints.beers.url)).responseJSON { (response) in
            switch(response.result){
            case .success:
                guard let JSONObject = response.result.value as? [[String: Any]] else{
                    failure(.parseError, ErrorMessages.getErrorMessage(error: .parseError))
                    return
                }
                
                let beers = JSONObject.map({ (beerDictionary) in
                    return Beer(with: beerDictionary)
                })
                success("Success", beers)
                
            case .failure:
                failure(.withoutInternet, ErrorMessages.getErrorMessage(error: .withoutInternet))
            }
        }
    }
    
}
