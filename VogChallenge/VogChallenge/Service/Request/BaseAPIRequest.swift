//
//  BaseAPIRequest.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//


import Alamofire

let JSON_SERVER_BASE_URL = "http://localhost:3000"
let REAL_API_DOMAIN = "api.foo.com"
let REAL_API_BASE_URL = "https://" + REAL_API_DOMAIN
let ENVIROMENT: EndPoint = .RealAPI

protocol BaseAPIRequest {
    var requestMethod: RequestHttpMethod?{ get }
    var requestBody: [String: Any]? { get }
    var requestPath: String {get}
    func request() -> URLRequest
}

extension BaseAPIRequest{

    public func request() -> URLRequest {
        let url: URL! = URL(string: baseUrl+requestPath)
        var request = URLRequest(url: url)
        switch requestMethod {
        case .Get:
            request.httpMethod = "GET"
            break
        case .Post:
            request.httpMethod = "POST"
            if let requestBody = requestBody {
                request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
            }
            break
        default:
            request.httpMethod = "GET"
            break
        }
        return request
    }
    
    var baseUrl: String {
        switch ENVIROMENT {
        case .JsonServer:
            return JSON_SERVER_BASE_URL
        case .RealAPI:
            return REAL_API_BASE_URL
        }
    }
}

enum RequestHttpMethod{
    case Get
    case Post
}

enum EndPoint{
    case JsonServer
    case RealAPI
}

