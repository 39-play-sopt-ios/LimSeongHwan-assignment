//
//  LoginView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

struct LoginView: View {
    @Binding var path: [Route]
    
    @State private var email: String = ""
    private var isEmailValid: Bool { AuthValidator.isValidEmail(email) }
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("로그인/가입하려는\n이메일을 입력해주세요")
                    .typography(.head2)
                    .padding(EdgeInsets(top: 109, leading: 8, bottom: 13, trailing: 0))
                Text("결제 등 중요 알림, 로그인, 비밀번호 찾기에 필요해요.")
                    .typography(.body1)
                    .padding(.leading, 8)
                    .padding(.bottom, 5)
                    .foregroundStyle(.gray300)
                Text("사용 중인 이메일을 입력해주세요")
                    .typography(.body1)
                    .padding(.leading, 8)
                    .foregroundStyle(.gray300)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            AuthTextField(text: $email, placeholder: "email@address.com", style: .email(isValid: isEmailValid))
                .padding(.top, 27)
            
            Spacer()
            
            CTAButton(title: "다음", isEnabled: isEmailValid) {
                path.append(.password(email: email))
            }
            .padding(.bottom, 13)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .screenBackground()
    }
}

#Preview {
    LoginView(path: .constant([]))
}
