//
//  ErrorView.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 17/02/2024.
//

import SwiftUI

struct ErrorView: View {
   
    
    typealias errorViewActionHandler = () -> Void
    let error: Error
    let handler : errorViewActionHandler
    internal init(error: Error, handler: @escaping ErrorView.errorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack{
            Image(systemName: "icloud.and.arrow.down")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 100, height: 100)
                .padding(.bottom,4)
            Text("Oooooops")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
                .multilineTextAlignment(.center)
                .padding(.bottom,4)

            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical , 10 )
            Button {

                handler()

            } label: {
                Text("retry")
                    
            }.padding(.vertical, 12)
                .padding(.horizontal,30)
                .background(.blue)
                .foregroundColor(.white)
                .font(.system(size: 15, weight: .heavy))
                .cornerRadius(10)
            

            
        }
        
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.DecodingError) {}
            .previewLayout(.sizeThatFits)
        
    }
}
