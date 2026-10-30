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
    let description: String
    let temperature: String
    var notice: String? = nil
    var isNew: Bool = false
    var isLiked: Bool = false

    var priceText: String {
        "\(price.formatted())원"
    }
}

extension MenuModel {
    static let newMenus: [MenuModel] = [
        MenuModel(
            name: "아이스 카스텔라 고구마 라떼",
            englishName: "Iced Castella Sweet Potato Milk",
            price: 6900,
            image: "menu1",
            description: "가을에 잘 어울리는 군고구마를 한 잔에 담은 음료.\n포슬한 카스텔라, 쫀득한 펄이 어우러져 다채로운 식감을 즐길 수 있는 음료.",
            temperature: "ICED ONLY",
            notice: "*컬러 드리즐은 시간이 지날수록 번지는 현상이 있으나\n음료 품질과는 무관하니 안심하고 드세요.",
            isNew: true
        ),
        MenuModel(
            name: "아이스 말차 글레이즈드 티 라떼",
            englishName: "Iced Malcha Glazed Tea Latte",
            price: 6700,
            image: "menu2",
            description: "글레이즈드의 색다른 변신! 쌉싸름한 말차와 달콤한 글레이즈드 소스를 넣어 조화롭게 즐기기 좋은 비주얼과 맛의 티 라떼 음료",
            temperature: "ICED ONLY",
            notice: "*말차 글레이즈드 티 라떼에는 카페인이 함유 되어 있습니다.\n*말차 글레이즈드 베이스에는 우유가 포함되어 있습니다.\n*번트 카라멜 파우더가 다량 제공될시 뭉침 현상이 있을 수 있으나 원료성분이므로 안심하고 드셔도 됩니다.",
            isNew: true
        ),
        MenuModel(
            name: "스타벅스 자몽 허니 에어로카노",
            englishName: "Starbucks GrapeFruit Honey Aerocano",
            price: 6100,
            image: "menu3",
            description: "상큼한 자몽의 풍미와 벨벳같은 미세한 거품으로\n부드러운 목넘김이 조화롭게 어우러져 밝고 산뜻하면서도\n균형 잡힌 맛을 선사하는 에어로카노",
            temperature: "ICED ONLY",
            notice: "* 완성 직후, 가장 풍부한 풍미와 캐스케이딩을 즐길 수 있습니다.",
            isNew: true
        ),
    ]
}
