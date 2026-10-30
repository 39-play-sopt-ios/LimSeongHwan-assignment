//
//  MainTab.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/25/26.
//

import Foundation

enum MainTab: CaseIterable {
    case home, pay, order, gift, other

    var title: String {
        switch self {
        case .home:
            return "Home"
        case .pay:
            return "Pay"
        case .order:
            return "Order"
        case .gift:
            return "Gift"
        case .other:
            return "Other"
        }
    }

    func icon(isSelected: Bool) -> String {
        "\(iconName)-\(isSelected ? "green" : "grey")"
    }

    private var iconName: String {
        switch self {
        case .home:
            return "home"
        case .pay:
            return "pay"
        case .order:
            return "order"
        case .gift:
            return "gift"
        case .other:
            return "other"
        }
    }
}
