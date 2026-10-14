//
//  CTAButton.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

struct CTAButton: View {
    enum Style {
        case primary
        case secondary
        
        var backgroundColor: Color {
            switch self {
            case .primary: .subGreen
            case .secondary: .white
            }
        }
        var foregroundColor: Color {
            switch self {
            case .primary: .white
            case .secondary: .darkGreen
            }
        }
    }
    
    let title: String
    var isEnabled: Bool = true
    var style: Style = .primary
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .typography(.medium)
                .foregroundStyle(isEnabled ? style.foregroundColor : .gray300)
                .frame(width: 331, height: 56)
                .background(RoundedRectangle(cornerRadius: 10).fill(isEnabled ? style.backgroundColor : .gray200))
        }
        .disabled(!isEnabled)
    }
}

#Preview {
    CTAButton(title: "다음", isEnabled: false) {}
    CTAButton(title: "가입하기", isEnabled: true) {}
    CTAButton(title: "완료", style: .secondary) {}
}
