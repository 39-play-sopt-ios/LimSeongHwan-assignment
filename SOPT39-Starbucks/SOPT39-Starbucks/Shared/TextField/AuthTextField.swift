//
//  AuthTextField.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

struct AuthTextField: View {
    enum Style {
        case email
        case password
    }
    
    @Binding var text: String
    let placeholder: String
    let style: Style

    @FocusState private var isFocused: Bool

    var body: some View {
        HStack {
            Group {
                if style == .email {
                    TextField("", text: $text, prompt: Text(placeholder))
                        .typography(.body2)
                        .focused($isFocused)
                        .padding(
                            EdgeInsets(top: 16, leading: 15, bottom: 17, trailing: 0)
                        )
                } else {
                    SecureField("", text: $text, prompt: Text(placeholder))
                        .typography(.body2)
                        .focused($isFocused)
                        .padding(
                            EdgeInsets(top: 16, leading: 15, bottom: 17, trailing: 16)
                        )
                }
            }
            if isFocused {
                HStack(spacing: 4) {
                    Image(.erase)
                    style == .email ? Image(.checkOff) : Image(.eyeOn)
                }
                .padding(.trailing, 16)
            }
        }
        .onTapGesture {
            isFocused = true
        }
        .frame(width: 313, height: 47)
        .background(.white)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isFocused ? Color.black : Color.clear, lineWidth: 1)
        }
    }
}

#Preview {
    @Previewable @State var email = ""
    @Previewable @State var password = ""
    AuthTextField(text: $email, placeholder: "email@email.com", style: .email)
    AuthTextField(text: $password, placeholder: "password", style: .password)
}
