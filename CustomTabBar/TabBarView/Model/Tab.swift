//
//  Tab.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 29/08/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home = "Home"
    case favorites = "Favorites"
    case search = "Search"
    case profile = "Profile"
    
    var systemImage: String {
        switch self {
        case .home:
            return "house.fill"
        case .favorites:
            return "bookmark.fill"
        case .search:
            return "sparkle.magnifyingglass"
        case .profile:
            return "person.fill"
        }
    }
    
    var TabColor: Color {
        switch self {
        case .home:
            return .orange
        case .favorites:
            return .purple
        case .search:
            return .pink
        case .profile:
            return .teal
        }
    }
}

