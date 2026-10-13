//
//  AuthValidation.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import Foundation

enum AuthValidator {
    static func isValidEmail(_ text: String) -> Bool {
        text.wholeMatch(of: /[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}/) != nil
    }
    
    static func isValidPassword(_ text: String) -> Bool {
        text.wholeMatch(of: /(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z\d]).{8,20}/) != nil
    }
}
