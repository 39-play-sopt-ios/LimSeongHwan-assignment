//
//  WelcomeView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var path: [Route]
    let nickname: String
    
    var body: some View {
        VStack {
            VStack(spacing: 31) {
                Image(.starbucksLogo)
                    .padding(.top, 69)
                Image(.starbucksLogoTyping)
            }
            .padding(.bottom, 94)
            
            Text("\(nickname)님\n가입을 환영합니다!")
                .typography(.head2)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            CTAButton(title: "메인으로", style: .secondary) {
                // 메인 뷰로 이동
            }
            .padding(.bottom, 13)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkGreen)
    }
}

#Preview {
    WelcomeView(path: .constant([]), nickname: "성환")
}
