//
//  OrderCategoryModel.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/27/26.
//

import Foundation

struct OrderCategoryModel: Identifiable {
    let id = UUID()
    let categoryName: String
    let categoryImage: String
    var route: OrderRoute? = nil
}

extension OrderCategoryModel {
    static let data: [OrderCategoryModel] = [
        OrderCategoryModel(categoryName: "NEW", categoryImage: "category-new", route: .newMenu),
        OrderCategoryModel(categoryName: "추천", categoryImage: "category-recommend"),
        OrderCategoryModel(categoryName: "콜드 브루", categoryImage: "category-coldbrew"),
        OrderCategoryModel(categoryName: "블론드", categoryImage: "category-blonde"),
        OrderCategoryModel(categoryName: "에스프레소", categoryImage: "category-espresso"),
    ]
}
