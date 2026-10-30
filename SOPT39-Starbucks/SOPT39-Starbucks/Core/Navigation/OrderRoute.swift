//
//  OrderRoute.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import Foundation

enum OrderRoute: Hashable {
    case newMenu
    case menuDetail(id: UUID)
}
