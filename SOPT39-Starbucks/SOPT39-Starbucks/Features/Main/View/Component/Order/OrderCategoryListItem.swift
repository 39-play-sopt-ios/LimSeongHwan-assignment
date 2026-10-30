//
//  OrderCategoryListItem.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/27/26.
//

import SwiftUI

struct OrderCategoryListItem: View {
    let data: OrderCategoryModel
    
    var body: some View {
        HStack(spacing: 21) {
            Image(data.categoryImage)
                .resizable()
                .scaledToFill()
                .frame(width: 61, height: 61)
                .clipShape(Circle())
            
            Text(data.categoryName)
                .typography(.categoryName)
                .foregroundStyle(.gray800)
            
            Spacer()
        }
        .padding(.horizontal, 28)
    }
}

#Preview {
    OrderCategoryListItem(data: OrderCategoryModel.data[0])
}
