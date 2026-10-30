//
//  DetailCircleButton.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import SwiftUI

struct DetailCircleButton: View {
    let icon: ImageResource
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(icon)
                .frame(width: 39, height: 39)
                .background(Circle().fill(.black.opacity(0.2)))
        }
    }
}

#Preview {
    DetailCircleButton(icon: .chevronLeftWhite) {}
    DetailCircleButton(icon: .shareWhite) {}
}
