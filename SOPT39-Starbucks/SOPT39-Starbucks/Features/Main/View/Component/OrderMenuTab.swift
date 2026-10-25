//
//  OrderMenuTab.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/25/26.
//

import SwiftUI

struct OrderMenuTab: View {
    let tabText: String
    let isSelected: Bool
    
    var body: some View {
        Text(tabText)
            .typography(.medium2)
            .foregroundStyle(isSelected ? .darkGreen : .gray300)
            .padding(.vertical, 14)
            .frame(width: 130)
            .overlay(alignment: .bottom) {
                if (isSelected) {
                    Rectangle()
                        .fill(.darkGreen)
                        .frame(height: 4)
                }
            }
    }
}

#Preview {
    OrderMenuTab(tabText: "전체 메뉴", isSelected: true)
    OrderMenuTab(tabText: "나만의 메뉴", isSelected: false)
}
