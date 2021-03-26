//
//  UserProfileService.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import Foundation
import Alamofire

class Service: ServiceProtocol {
    
    static let shared = Service()
    
    static let sessionManager: Alamofire.Session = {
        let manager = ServerTrustManager(evaluators: [REAL_API_DOMAIN: DisabledTrustEvaluator()])
        let session = Session(serverTrustManager: manager)
        return session
    }()
    
    func getUserProfile(completion: @escaping ((Result<UserProfileModel, Error>) -> Void)) {
        let request = GetEventListApiRequest();
        Service.sessionManager.request(request.request()).responseJSON { json in
            print(json)
        }
        Service.sessionManager.request(request.request()).responseDecodable(of: UserProfileResponse.self) { response in
            switch response.result{
            case .success(let useProfileResponse):
                completion(.success(useProfileResponse.data ?? UserProfileModel()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func postBasicInfo(basicInfo: [String : Any], completion: @escaping ((Result<Void, Error>) -> Void)) {
        let request = PostBasicInfoRequest(body: basicInfo)
        Service.sessionManager.request(request.request()).responseDecodable { (response:AFDataResponse<UserProfileResponse>) in
            switch response.result{
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func changePassword(passwordChange: [String : Any], completion: @escaping ((Result<String?, Error>) -> Void)) {
        let request = ChangePasswordRequest(body: passwordChange)
        Service.sessionManager.request(request.request()).responseDecodable { (response:AFDataResponse<PasswordChangeResponse>) in
            print(response)
            switch response.result{
            case .success(let passwordChangeResponse):
                completion(.success(passwordChangeResponse.message))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
