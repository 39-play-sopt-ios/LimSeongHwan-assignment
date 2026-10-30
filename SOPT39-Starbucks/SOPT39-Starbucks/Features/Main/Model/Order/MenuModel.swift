//
//  MenuModel.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import Foundation

struct MenuModel: Identifiable {
    let id = UUID()
    let name: String
    let englishName: String
    let price: Int
    let image: String

    var priceText: String {
        "\(price.formatted())원"
    }
}

extension MenuModel {
    static let newMenus: [MenuModel] = [
        MenuModel(name: "아이스 카스텔라 고구마 라떼", englishName: "Iced Castella Sweet Potato Milk", price: 6900, image: "menu1"),
        MenuModel(name: "아이스 말차 글레이즈드 티 라떼", englishName: "Iced Malcha Glazed Tea Latte", price: 6700, image: "menu2"),
        MenuModel(name: "스타벅스 자몽 허니 에어로카노", englishName: "Starbucks GrapeFruit Honey Aerocano", price: 6100, image: "menu3"),
    ]
}
