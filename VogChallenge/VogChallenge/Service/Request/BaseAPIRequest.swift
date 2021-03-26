//
//  BaseAPIRequest.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import Alamofire

let MOCK_BASE_URL = "http://localhost:3000"
let REAL_DOMAIN = "api.foo.com"
let REAL_BASE_URL = "https://" + REAL_DOMAIN
let ENVIROMENT: EndPoint = .RealAPI

enum RequestHttpMethod{
    case Get
    case Post
}

enum EndPoint{
    case MockAPI
    case RealAPI
}

protocol BaseAPIRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var requestBody: [String: Any]? { get }
    var requestPath: String {get}
    func request() -> URLRequest
}

extension BaseAPIRequest{
    
    var endPoint: EndPoint {
        return .RealAPI
    }
    
    var baseUrl: String {
        switch endPoint {
        case .MockAPI:
            return MOCK_BASE_URL
        case .RealAPI:
            return REAL_BASE_URL
        }
    }
    
    func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if let requestBody = requestBody {
                request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: .prettyPrinted)
            }
            break
        default:
            request.httpMethod = "GET"
            break
        }
        return request
    }
}
