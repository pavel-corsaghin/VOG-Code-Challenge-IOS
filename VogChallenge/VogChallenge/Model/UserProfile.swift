//
//  UserProfileResponse.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import Foundation

class UserProfileModel: Codable {
    var firstName: String?
    var userName: String?
    var lastName: String?
}

class UserProfileResponse: Codable {
    var data: UserProfileModel?
    var message: String?
}

