//
//  HomeApp.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import SwiftUI

struct HomeApp: View {
    @Environment(\.openURL) var openURL
   @ObservedObject var viewModel = NewsViewModelImpli(service: NewsServiceImpli())
    var body: some View {

        Group{
            switch viewModel.state {
            case .loading :
                ProgressView()
            case.faild(let error) :
                ErrorView(error: error, handler: viewModel.getArticles)
            case.success(let articles) :
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                            load(url: item.url)
                        }
                    }
                    .navigationTitle("News")
                }
            }
        }.onAppear(perform: viewModel.getArticles)

    }
    func load(url: String?) {
        guard let link = url , let url = URL(string: link) else{return}
        openURL(url)
    }
}

struct HomeApp_Previews: PreviewProvider {
    static var previews: some View {
        HomeApp()
    }
}
