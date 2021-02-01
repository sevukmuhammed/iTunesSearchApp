//
//  MoyaProvider.swift
//  SearchApp
//
//  Created by Muhammed Sevük on 29.01.2021.
//

import Foundation
import Moya

let provider: MoyaProvider<API> = {
    return MoyaProvider<API>.init(plugins: [NetworkLoggerPlugin()])
}()

enum API {
    case search(_ term: String, _ media: String, _ limit: Int)
}

extension API: TargetType {
    var baseURL: URL {
        return URL(string: "https://itunes.apple.com")!
    }
    
    var path: String {
        return "/search"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "sample".data(using: .utf8) ?? Data()
    }
    
    var task: Task {
        switch self {
        case .search(let term, let media, let limit):
            return .requestParameters(parameters: [
                                        "term": term,
                                        "media": media,
                                        "limit": limit
                                        ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Accept": "*/*"]
    }
    
    
}
