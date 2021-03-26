//
//  MainViewModel.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 25/03/2021.
//

import Foundation

protocol UserProfilePresenterDelegate: AnyObject  {
    func onError(errorMessage: String)
    func getUserProfileSuccess(_ userProfile: UserProfileModel)
    func onSaveBasicInfoSuccess()
    func onChangePasswordSuccess()
    func toggleLoading(show: Bool)
}

class UserProfilePresenter {
    
    weak var delegate: UserProfilePresenterDelegate?
    
    func getUserProfile() {
        self.delegate?.toggleLoading(show: true)
        Service.shared.getUserProfile{[weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.toggleLoading(show: false)
            switch result {
            case .success(let userProfile):
                strongSelf.delegate?.getUserProfileSuccess(userProfile)
            case .failure(let error):
                strongSelf.delegate?.onError(errorMessage: error.localizedDescription)
            }}
    }
    
    func didClickSaveBasicInfo(userName: String?, firstName: String?, lastName: String?) {
        guard let firstName = firstName, firstName != "" else {
            self.delegate?.onError(errorMessage: "First name can not empty")
            return
        }
        
        guard let lastName = lastName, lastName != "" else {
            self.delegate?.onError(errorMessage: "Last name can not empty")
            return
        }
        
        self.delegate?.toggleLoading(show: true)
        let userProfile: [String: Any] = ["userName": userName, "firstName": firstName, "lastName": lastName ]
        Service.shared.postBasicInfo(basicInfo: userProfile){[weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.toggleLoading(show: false)
            switch result {
            case .success:
                strongSelf.delegate?.onSaveBasicInfoSuccess()
            case .failure(let error):
                strongSelf.delegate?.onError(errorMessage: error.localizedDescription)
            }}
    }
    
    func didClickChangePassword(currentPasword: String?, newPassword: String?, passwordConfirmation: String?) {
 
        guard let currentPasword = currentPasword, currentPasword != "" else {
            self.delegate?.onError(errorMessage: "Please enter current password")
            return
        }
        
        guard let newPassword = newPassword, newPassword != "" else {
            self.delegate?.onError(errorMessage: "Please enter new password")
            return
        }
        
        guard let passwordConfirmation = passwordConfirmation, passwordConfirmation != "" else {
            self.delegate?.onError(errorMessage: "Please re-enter new password")
            return
        }
        
        if (newPassword != passwordConfirmation) {
            self.delegate?.onError(errorMessage: "New password not match")
            return
        }
        
        self.delegate?.toggleLoading(show: true)
        let passwordChange: [String: Any] = ["currentPasword": currentPasword, "newPassword": newPassword, "passwordConfirmation": passwordConfirmation ]
        Service.shared.changePassword(passwordChange: passwordChange){[weak self] result in
            guard let strongSelf = self else { return }
            strongSelf.delegate?.toggleLoading(show: false)
            switch result {
            case .success:
                strongSelf.delegate?.onChangePasswordSuccess()
            case .failure(let error):
                strongSelf.delegate?.onError(errorMessage: error.localizedDescription)
            }}
    }
}
