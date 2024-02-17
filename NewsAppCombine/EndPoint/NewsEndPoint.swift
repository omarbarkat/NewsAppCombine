//
//  NewsEndPoint.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation
import SwiftUI

protocol APIBulder {
    var urlRequest : URLRequest{get}
    var baseURL : URL{get}
    var Path : String {get}
}
enum NewsAPI {
    case getNews
}
extension NewsAPI : APIBulder {
    var baseURL: URL {
        switch  self {
        case .getNews :
            return URL(string: "https://api.lil.software")!
        }
    }
    var Path: String {
        return "/news"
    }  
    
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.Path))
        
    }
    
  
    
  
    
    
}
