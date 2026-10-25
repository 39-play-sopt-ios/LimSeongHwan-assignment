//
//  RootView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import SwiftUI

struct RootView: View {
    @State private var path: [Route] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            LoginView(path: $path)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .password(let email):
                        PasswordView(path: $path, email: email)
                    case .welcome(let nickname):
                        WelcomeView(path: $path, nickname: nickname)
                    }
                }
        }
    }
}

#Preview {
    RootView()
}
