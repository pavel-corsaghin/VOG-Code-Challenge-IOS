//
//  UIViewControllerExtension.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 25/03/2021.
//

import Foundation

import UIKit

extension UIViewController {
    /// Show an alert message with title and message texts
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
