//
//  ArticleView.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 14/02/2024.
//

import SwiftUI
import URLImage

struct ArticleView: View {

    let article : Article

    var body: some View {

            
        HStack {
            if let  urlstring = article.image,
               let url = URL(string: urlstring) {
                URLImage(url, identifier: article.id.uuidString) { progress in
                    Image(systemName: "hourglass.circle")
//                        .resizable()
                        .frame(width: 100, height: 100) 
                } failure: { error, _ in
                    PlaceholderView()
                } content: { image, info in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: 100, height: 100)
                .cornerRadius(10)

                

            }else {
                PlaceholderView()
            }
            VStack(alignment: .leading, spacing: 4){
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
                
            }
        }


    }
}
struct PlaceholderView : View {
    var body: some View {
        Image(systemName: "photo,fill")
            .resizable()
            .foregroundColor(.white)
            .background(.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
            .previewLayout(.sizeThatFits)
        
    }
}




//                URLImage(url : url,
//                         options: URLImageOptions(
//                            indentifier: article.id.uuidString ,
//                            cachePolicy: .returnStoreElseLoad(downloadDelay: 0.25)
//
//                         ),
//                         failure: { error , _ in
//                    Image(systemName: "photo,fill")
//                        .resizable()
//                        .foregroundColor(.white)
//                        .background(.gray)
//                        .frame(width: 100, height: 100)
//
//
//                },
//                         content: { image in
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//
//                })
