//
//  ChangePasswordRequest.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 26/03/2021.
//

import Foundation

class ChangePasswordRequest: BaseAPIRequest {
    var requestBody: [String : Any]?

    var requestMethod: RequestHttpMethod? = RequestHttpMethod.Post
            
    var requestPath: String = "/password/change"
    
    init(body: [String : Any]) {
        self.requestBody = body
    }
}
