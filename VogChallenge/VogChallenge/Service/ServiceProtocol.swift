//
//  UserProfileServiceProtocol.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import Foundation

protocol ServiceProtocol {
    func getUserProfile(completion: @escaping ((Result<UserProfileModel, Error>) -> Void))
    
    func postBasicInfo(basicInfo: [String : Any], completion: @escaping ((Result<Void, Error>) -> Void))
    
    func changePassword(passwordChange: [String : Any], completion: @escaping ((Result<String?, Error>) -> Void))

}
