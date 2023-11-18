//
//  CTabItem.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 25/11/23.
//

import SwiftUI

struct CTabItem: View {
    // Constants
//    private let activeImageSize: CGFloat = 58
//    private let inactiveImageSize: CGFloat = 32
    private let activeImageSize: CGFloat = UIScreen.main.bounds.width * 0.13
    private let inactiveImageSize: CGFloat = UIScreen.main.bounds.width * 0.050

    private let activeTextColor: Color = .teal
    private let inactiveTextColor: Color = .gray
    private let circleGradient = Color.teal.opacity(0.7)
    private let springAnimation = Animation.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)

    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint

    @State private var tabPosition: CGPoint = .zero

    var body: some View {
        VStack(spacing: 5) {
            // Icon
            Image(systemName: tab.systemImage )
                .font(.title2)
                .foregroundColor(activeTab == tab ? tint : inactiveTint)
                .frame(width: activeTab == tab ? activeImageSize : inactiveImageSize,
                       height: activeTab == tab ? activeImageSize : inactiveImageSize)
                .scaleEffect(activeTab == tab ? 1.2 : 1.0)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tab.TabColor.gradient.opacity(0.7))
                            .matchedGeometryEffect(id: "ActiveTab", in: animation)
                    }
                }

            // Tab Text
            Text(tab.rawValue)
                .font(.system(size: 12))
                .foregroundColor(activeTab == tab ? tab.TabColor : inactiveTextColor)
                .padding(.bottom, 30)
          
        }
        .padding(.bottom)
        .frame(maxWidth: .infinity)
        .viewPosition { rect in
            tabPosition.x = rect.midX
            if activeTab == tab {
                position.x = rect.midX
            }
        }
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
