//
//  NewsViewModel.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}
class NewsViewModelImpli : ObservableObject , NewsViewModel {
    
    private var service : NewsService
    private var cancellable = Set<AnyCancellable>()
    @Published private(set) var state : ResultState = .loading
    private(set) var articles = [Article]()
    
    init(service : NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        let cancellable = service
            .request(from: .getNews)
            .sink { result in
                switch result {
                    
                case .finished:
                    self.state = .success(content: self.articles)
                case .failure(let error):
                    self.state = .faild(error: error)
                }
            } receiveValue: { response in
                self.articles = (response.articles)
            }
        self.cancellable.insert(cancellable)

        
    }
}

