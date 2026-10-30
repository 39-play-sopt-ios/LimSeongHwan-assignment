//
//  OrderCategoryModel.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/27/26.
//

import DeveloperToolsSupport
import Foundation

struct OrderCategoryModel: Identifiable {
    let id = UUID()
    let categoryName: String
    let categoryImage: ImageResource
}

extension OrderCategoryModel {
    static let data: [OrderCategoryModel] = [
        OrderCategoryModel(categoryName: "NEW", categoryImage: .categoryNew),
        OrderCategoryModel(categoryName: "추천", categoryImage: .categoryRecommend),
        OrderCategoryModel(categoryName: "콜드 브루", categoryImage: .categoryColdbrew),
        OrderCategoryModel(categoryName: "블론드", categoryImage: .categoryBlonde),
        OrderCategoryModel(categoryName: "에스프레소", categoryImage: .categoryEspresso),
    ]
}
