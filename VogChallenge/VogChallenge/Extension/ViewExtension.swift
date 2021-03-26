//
//  View.swift
//  VogChallenge
//
//  Created by HUNGNM24 on 25/03/2021.
//

import UIKit

extension UIButton {
    
    func addBorder() {
        self.backgroundColor = .clear
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
    }
}
