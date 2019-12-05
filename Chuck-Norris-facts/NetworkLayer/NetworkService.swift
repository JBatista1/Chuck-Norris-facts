//
//  NetworkService.swift
//  Chuck-Norris-facts
//
//  Created by Joao Batista on 05/12/19.
//  Copyright © 2019 Joao Batista. All rights reserved.
//
//
//import Foundation
//
//enum NetworkService<T: Codable>: ServiceProtocol {
//    case getTextSearch(T.Type)
//    
//    var baseURL: URL {
//        let url = "https://api.chucknorris.io/jokes/"
//        return URL(string: url) ?? URL(fileURLWithPath: "")
//    }
//    
//    var path: String{
//        switch self {
//        case .getTextSearch:
//            return "/search?"
//        default:
//            <#code#>
//        }
//    }
//    
//    var method: HTTPMethod
//    
//    var task: HTTPTask
//    
//    var headers: Headers?
//    
//    var parametersEncoding: ParametersEncoding
//    
//    
//}
