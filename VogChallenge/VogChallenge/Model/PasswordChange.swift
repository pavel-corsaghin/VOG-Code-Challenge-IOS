//
//  Password.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 26/03/2021.
//

import Foundation

class PasswordChangeModel: Codable {
    var currentPasword: String?
    var newPassword: String?
    var passwordConfirmation: String?
}

class PasswordChangeResponse: Codable {
    var code: String?
    var message: String?
    var exceptionName: String?
}
