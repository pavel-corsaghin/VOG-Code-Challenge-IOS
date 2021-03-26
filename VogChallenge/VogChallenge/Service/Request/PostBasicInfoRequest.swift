//
//  PostBasicInfoRequest.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 25/03/2021.
//

import Foundation

class PostBasicInfoRequest: BaseAPIRequest {
    var requestBody: [String : Any]?

    var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
    
    var requestPath: String = "/profiles/update"

    init(body: [String : Any]) {
        self.requestBody = body
    }
}
