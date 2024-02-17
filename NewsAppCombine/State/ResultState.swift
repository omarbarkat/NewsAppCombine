//
//  ResultState.swift
//  NewsAppCombine
//
//  Created by Omar barkat on 13/02/2024.
//

import Foundation

enum ResultState {
    case loading
    case success(content:[Article])
    case faild (error: Error)
}
