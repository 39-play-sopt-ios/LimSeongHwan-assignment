//
//  RootView.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/13/26.
//

import SwiftUI

struct RootView: View {
    @State private var path: [Route] = []
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            MainTabView()
        } else {
            NavigationStack(path: $path) {
                LoginView(path: $path)
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .password(let email):
                            PasswordView(path: $path, email: email)
                        case .welcome(let nickname):
                            WelcomeView(path: $path, nickname: nickname) {
                                isLoggedIn = true
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    RootView()
}
