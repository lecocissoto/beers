//
//  BeerError.swift
//  Beers
//
//  Created by Leandro Cissoto Ramos on 7/20/17.
//  Copyright © 2017 Cissoto Ramos Tecnologia da Informacao. All rights reserved.
//

import Foundation

enum BeerErrors{
    case withoutInternet
    case serverProblem
    case parseError
    case invalidParameter
}

struct BeersErrorHandler{
    enum ErrorMessages: String{
        case withoutInternet  = "Sem conexão com Internet. Espero que você esteja em um bar."
        case serverProblem    = "Estamos em manutenção. Tome uma gelada enquanto isso"
        case parseError       = "Problemas no aplicativo para transformar sua cerveja em objeto."
        case invalidParameter = "Ops, o que está tentando passar?"
    }
    
    static func getErrorMessage(error: BeerErrors)->String{
        let message: String!
        
        switch error{
        case .withoutInternet:
            message = ErrorMessages.withoutInternet.rawValue
        case .serverProblem:
            message = ErrorMessages.serverProblem.rawValue
        case .parseError:
            message = ErrorMessages.parseError.rawValue
        case .invalidParameter:
            message = ErrorMessages.invalidParameter.rawValue
        }
        
        return message
    }
}
