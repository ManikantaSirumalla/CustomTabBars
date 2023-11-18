//
//  TabItem.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 29/08/23.
//

import SwiftUI

struct ScaledTabItem: View {
    // Constants
    private let activeImageSize: CGFloat = UIScreen.main.bounds.width * 0.1
    private let inactiveImageSize: CGFloat = UIScreen.main.bounds.width * 0.050

    private let activeTextColor: Color = .teal
    private let inactiveTextColor: Color = .gray
    private let springAnimation = Animation.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)

    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint

    @State private var tabPosition: CGPoint = .zero

    var body: some View {
        VStack {
            // Icon
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundColor(activeTab == tab ? tint : inactiveTint)
                .frame(width: activeTab == tab ? activeImageSize : inactiveImageSize,
                       height: activeTab == tab ? activeImageSize : inactiveImageSize)
                .scaleEffect(activeTab == tab ? 1.4 : 1.0)

            // Tab Text
            Text(tab.rawValue)
                .font(.system(size: 12))
                .foregroundColor(activeTab == tab ? activeTab.TabColor : inactiveTextColor)
                .padding(.bottom, 30)
               
          
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
        .onTapGesture {
            // Set active tab
            activeTab = tab

            // Animate position change
            withAnimation(springAnimation) {
                position.x = tabPosition.x
            }
        }
    }
}


