//
//  NewResponse.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation
// MARK: - MrIOS
struct NewsResponse: Codable  {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable , Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let description: String?
    let image: String?
    let date: Date?
    
//    enum : CodingKey , String {
//        case author , url , source , title
//        case articleDescription = "description"
//        case image , date
//    }
}
extension Article {
    static var  dummyData : Article {
        .init(author: "Rachel Pannett",
              url: "https://www.washingtonpost.com/style/2024/02/13/usher-married-jennifer-goicoechea-super-bowl/",
              source: "The Washington Post",
              title: "Usher marries Jennifer Goicoechea on Super Bowl Sunday - The Washington Post - The Washington Post",
              description: "The same day he gave a widely acclaimed performance at the Super Bowl, the R&B artist also found time to marry his longtime girlfriend, Jennifer Goicoechea.",
              image:  "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/4VV4TWX3Z4H75OYSSZ2MJZBX2E_size-normalized.jpg&w=1440",
              date: Date())
    }
}
