//
//  MenuViewModel.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/30/26.
//

import Foundation
import Observation

@Observable
final class MenuViewModel {
    private(set) var newMenus: [MenuModel] = MenuModel.newMenus

    func menu(id: UUID) -> MenuModel? {
        newMenus.first { $0.id == id }
    }

    func toggleLike(id: UUID) {
        guard let index = newMenus.firstIndex(where: { $0.id == id }) else { return }
        newMenus[index].isLiked.toggle()
    }
}
