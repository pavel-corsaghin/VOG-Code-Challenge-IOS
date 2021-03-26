//
//  GetUserProfileRequest.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import Foundation

class GetEventListApiRequest: BaseAPIRequest {
    var requestBody: [String : Any]?
        
    var requestMethod: RequestHttpMethod? = RequestHttpMethod.Get
            
    var requestPath: String = "/profiles/mine"
}
