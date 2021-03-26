//
//  ViewController.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 24/03/2021.
//

import UIKit
import SVProgressHUD

class ViewController: UITableViewController {
    
    @IBOutlet weak var tfUserName: UITextField!
    @IBOutlet weak var tfFirstName: UITextField!
    @IBOutlet weak var tfLastName: UITextField!
    @IBOutlet weak var tfCurrentPassword: UITextField!
    @IBOutlet weak var tfNewPassword: UITextField!
    @IBOutlet weak var tfConfirmPassword: UITextField!
    @IBOutlet weak var btnSaveName: UIButton!
    @IBOutlet weak var btnSavePassword: UIButton!
    
    let userProfilePresenter = UserProfilePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        handleDismissKeyboard()
        userProfilePresenter.delegate = self
        userProfilePresenter.getUserProfile()
    }
    
    private func setupView() {
        title = "User Profile"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        btnSaveName.addBorder()
        btnSavePassword.addBorder()
    }
    
    private func handleDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func didClickSaveBasicInfo(_ sender: Any) {
        userProfilePresenter.didClickSaveBasicInfo(userName: tfUserName.text, firstName: tfFirstName.text, lastName: tfLastName.text)
    }
    
    @IBAction func didClickSavePassword(_ sender: Any) {
        userProfilePresenter.didClickChangePassword(currentPasword: tfCurrentPassword.text, newPassword: tfNewPassword.text, passwordConfirmation: tfConfirmPassword.text)
    }
}

extension ViewController: UserProfilePresenterDelegate {
    
    func onError(errorMessage: String) {
        showAlert(title: "Error", message: errorMessage)
    }
    
    func getUserProfileSuccess(_ userProfile: UserProfileModel) {
        tfUserName.text = userProfile.userName
        tfFirstName.text = userProfile.firstName
        tfLastName.text = userProfile.lastName
    }
    
    func onSaveBasicInfoSuccess() {
        showAlert(title: "Success", message: "Update info successfully")
    }
    
    func onChangePasswordSuccess() {
        showAlert(title: "Success", message: "Change password successfully")
        tfCurrentPassword.text = ""
        tfNewPassword.text = ""
        tfConfirmPassword.text = ""
    }
    
    func toggleLoading(show: Bool) {
        if (show) {
            SVProgressHUD.show()
        } else {
            SVProgressHUD.dismiss()
        }
    }
    
}

