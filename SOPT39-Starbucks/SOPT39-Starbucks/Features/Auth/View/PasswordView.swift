//
//  PasswordView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import SwiftUI

struct PasswordView: View {
    @Binding var path: [Route]
    var email: String
    
    @State private var password: String = ""
    @State private var nickname: String = ""
    private var isPasswordValid: Bool { AuthValidator.isValidPassword(password) }
    @State private var isNicknameSheetPresented: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("사용할 비밀번호를\n입력해주세요")
                    .typography(.head2)
                    .padding(EdgeInsets(top: 109, leading: 8, bottom: 13, trailing: 0))
                Text("\(email)로 가입중")
                    .typography(.body1)
                    .padding(.leading, 8)
                    .padding(.bottom, 5)
                    .foregroundStyle(.gray300)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 30)
            
            VStack(alignment: .leading, spacing: 0) {
                AuthTextField(text: $password, placeholder: "비밀번호 입력", style: .password)
                    .padding(.top, 27)
                    .padding(.horizontal, 31)
                
                HStack(spacing: 5) {
                    Image(isPasswordValid ? .enableOn : .enableOff)
                    Text("영문, 숫자, 특수문자 포함 10글자 이상")
                        .typography(.body2)
                        .foregroundStyle(isPasswordValid ? .darkGreen : .gray300)
                }
                .padding(.top, 13)
                .padding(.leading, 35)
            }
            
            Button {
                isNicknameSheetPresented = true
            } label: {
                Group {
                    if nickname.isEmpty {
                        Text("닉네임 설정")
                            .underline()
                    } else {
                        Text("\(nickname)")
                    }
                }
                .typography(.body2)
                .foregroundStyle(.gray300)
            }
            .padding(.top, 40)
            
            Spacer()
            
            CTAButton(title: "가입하기", isEnabled: isPasswordValid && !nickname.isEmpty) {
                path.append(.welcome(nickname: nickname))
            }
            .padding(.bottom, 13)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .screenBackground()
        .sheet(isPresented: $isNicknameSheetPresented) {
            AuthBottomSheet(nickname: $nickname)
                .presentationDetents([.medium])
                .presentationDragIndicator(.visible)
                .presentationBackground(.darkGreen)
        }
    }
}

#Preview {
    PasswordView(path: .constant([]), email: "email@email.com")
}
