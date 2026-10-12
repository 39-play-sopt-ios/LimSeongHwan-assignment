//
//  Typography.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

enum Typography {
    case head2
    case subhead
    case medium
    case body1
    case body2

    var size: CGFloat {
        switch self {
        case .head2: 23
        case .subhead: 18
        case .medium: 18
        case .body1: 12
        case .body2: 12
        }
    }

    var weight: Font.Weight {
        switch self {
        case .head2: .semibold
        case .subhead: .semibold
        case .medium: .medium
        case .body1: .regular
        case .body2: .regular
        }
    }

    var lineHeightPercent: CGFloat {
        switch self {
        case .head2: 100
        case .subhead: 100
        case .medium: 100
        case .body1: 100
        case .body2: 100
        }
    }

    var letterSpacingPercent: CGFloat {
        switch self {
        case .head2: 0
        case .subhead: 0
        case .medium: 0
        case .body1: 0
        case .body2: 0
        }
    }

    var lineHeight: CGFloat {
        size * lineHeightPercent / 100
    }

    var letterSpacing: CGFloat {
        size * letterSpacingPercent / 100
    }
}

private struct TypographyModifier: ViewModifier {
    let style: Typography

    func body(content: Content) -> some View {
        let extraSpacing = style.lineHeight - Pretendard.uiFont(size: style.size, weight: style.weight).lineHeight
        content
            .font(.pretendard(size: style.size, weight: style.weight))
            .tracking(style.letterSpacing)
            .lineSpacing(extraSpacing)
            .padding(.vertical, extraSpacing / 2)
    }
}

extension View {
    func typography(_ style: Typography) -> some View {
        modifier(TypographyModifier(style: style))
    }
}
