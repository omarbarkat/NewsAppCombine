//
//  APIError.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation

enum APIError : Error {
    case DecodingError
    case errorCode(Int)
    case unknown
}
extension APIError : LocalizedError {
    var errorDescription: String? {
        switch self {
        case .DecodingError :
            return "faild in decode object from the service"
        case .errorCode(let Code):
            return "\(Code) - something went error"
        case .unknown:
            return "unknown error"
        }
        
    }
}
