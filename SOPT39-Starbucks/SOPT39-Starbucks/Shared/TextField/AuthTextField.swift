//
//  AuthTextField.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

struct AuthTextField: View {
    enum Style {
        case email(isValid: Bool)
        case password
        case nickname
    }
    
    @Binding var text: String
    let placeholder: String
    let style: Style

    @FocusState private var isFocused: Bool
    @State private var isPasswordSecure: Bool = true

    var body: some View {
        HStack {
            inputField
                .typography(.body2)
                .focused($isFocused)
                .textInputAutocapitalization(.never)
                .padding(.leading, 15)
            
            if isFocused {
                HStack(spacing: 4) {
                    Button {
                        text = ""
                    } label: {
                        Image(.erase)
                    }
                    trailingButton
                }
                .padding(.trailing, 16)
            }
        }
        .onTapGesture {
            isFocused = true
        }
        .frame(width: 313, height: 47)
        .background(.white)
        .containerShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isFocused ? Color.black : Color.clear, lineWidth: 1)
        }
    }
    
    @ViewBuilder
    private var inputField: some View {
        switch style {
        case .email:
            TextField("", text: $text, prompt: Text(placeholder))
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
        case .password:
            Group {
                if isPasswordSecure {
                    SecureField("", text: $text, prompt: Text(placeholder))
                        .textContentType(.password)
                } else {
                    TextField("", text: $text, prompt: Text(placeholder))
                }
            }
        case .nickname:
            TextField("", text: $text, prompt: Text(placeholder))
        }
    }
    
    @ViewBuilder
    private var trailingButton: some View {
        switch style {
        case .email(let isValid):
            Image(isValid ? .checkOn : .checkOff)
        case .password:
            Button {
                isPasswordSecure.toggle()
                Task {
                    isFocused = true
                }
            } label: {
                Image(isPasswordSecure ? .eyeOn : .eyeOff)
            }
        case .nickname:
            EmptyView()
        }
    }
}

#Preview {
    @Previewable @State var email = ""
    @Previewable @State var password = ""
    AuthTextField(text: $email, placeholder: "email@email.com", style: .email(isValid: false))
    AuthTextField(text: $email, placeholder: "email@email.com", style: .email(isValid: true))
    AuthTextField(text: $password, placeholder: "password", style: .password)
}
