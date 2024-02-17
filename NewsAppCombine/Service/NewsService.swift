//
//  NewsService.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endPoint : NewsAPI) -> AnyPublisher<NewsResponse , APIError>
}

struct NewsServiceImpli : NewsService {
    func request(from endPoint: NewsAPI) -> AnyPublisher<NewsResponse, APIError> {
        return URLSession
            .shared
            .dataTaskPublisher(for: endPoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError{_ in APIError.unknown}
            .flatMap({ data , response -> AnyPublisher<NewsResponse , APIError> in
                guard let response = response as? HTTPURLResponse else{
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                if (200...299).contains(response.statusCode) {
                    let jsonData = JSONDecoder()
                    jsonData.dateDecodingStrategy = .iso8601
                    return Just(data)
                        .decode(type: NewsResponse.self, decoder: jsonData)
                        .mapError { _ in
                            APIError.DecodingError
                        }
                        .eraseToAnyPublisher()
                }else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            })
            .eraseToAnyPublisher()
    }
}

