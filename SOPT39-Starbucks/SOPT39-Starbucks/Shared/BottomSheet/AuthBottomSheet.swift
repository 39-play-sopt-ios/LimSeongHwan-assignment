//
//  AuthBottomSheet.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import SwiftUI

struct AuthBottomSheet: View {
    @Binding var nickname: String
    @State private var input: String = ""
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Text("닉네임을 입력해주세요")
                .typography(.subhead)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 42)
                .padding(.leading, 22)
            
            AuthTextField(text: $input, placeholder: "닉네임", style: .nickname)
                .padding(.top, 19)
            
            Spacer()
            
            CTAButton(title: "완료", style: .secondary) {
                nickname = input
                dismiss()
            }
            .padding(.bottom, 12)
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    @Previewable @State var nickname: String = ""
    AuthBottomSheet(nickname: $nickname)
}
