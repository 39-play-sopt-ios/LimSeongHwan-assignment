//
//  Typography.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

enum Typography {
    case head1
    case head2
    case subhead
    case subhead2
    case medium
    case medium2
    case body1
    case body2
    case storeName
    case basketCount
    case tabbarText

    var size: CGFloat {
        switch self {
        case .head1: 28
        case .head2: 23
        case .subhead: 18
        case .subhead2: 14
        case .medium: 18
        case .medium2: 14
        case .body1: 12
        case .body2: 12
        case .storeName: 13
        case .basketCount: 15
        case .tabbarText: 12
        }
    }

    var weight: Font.Weight {
        switch self {
        case .head1: .semibold
        case .head2: .semibold
        case .subhead: .semibold
        case .subhead2: .semibold
        case .medium: .medium
        case .medium2: .medium
        case .body1: .regular
        case .body2: .regular
        case .storeName: .medium
        case .basketCount: .semibold
        case .tabbarText: .medium
        }
    }

    var lineHeightPercent: CGFloat {
        switch self {
        case .head1: 100
        case .head2: 100
        case .subhead: 100
        case .subhead2: 100
        case .medium: 100
        case .medium2: 100
        case .body1: 100
        case .body2: 100
        case .storeName: 100
        case .basketCount: 100
        case .tabbarText: 100
        }
    }

    var letterSpacingPercent: CGFloat {
        switch self {
        case .head1: 0
        case .head2: 0
        case .subhead: 0
        case .subhead2: 0
        case .medium: 0
        case .medium2: 0
        case .body1: 0
        case .body2: 0
        case .storeName: 0
        case .basketCount: 0
        case .tabbarText: 0
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
