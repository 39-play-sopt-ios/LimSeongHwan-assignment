//
//  MainHeader.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/25/26.
//

import SwiftUI

struct MainHeader: View {
    var body: some View {
        HStack {
            Button {
                // 뒤로가기
            } label: {
                Image(.chevronLeftWhite)
                    .renderingMode(.template)
                    .foregroundStyle(.gray500)
            }
            
            Spacer()
            
            Button {
                // 검색
            } label: {
                Image(.searchGrey)
            }
        }
        .padding(.vertical, 14)
        .padding(.horizontal, 21)
    }
}

#Preview {
    MainHeader()
}
