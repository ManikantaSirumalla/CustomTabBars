//
//  TabBarViewModel.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 29/08/23.
//

import Foundation
import SwiftUI

class TabBarViewModel: ObservableObject {
    @Published var activeTab: Tab = .home
    @Published var tabShapePosition: CGPoint = .zero
}
