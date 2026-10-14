//
//  Route.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import Foundation

enum Route: Hashable {
    case password(email: String)
    case welcome(nickname: String)
}
