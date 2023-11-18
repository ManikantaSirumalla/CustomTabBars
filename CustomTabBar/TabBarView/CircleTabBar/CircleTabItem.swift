//
//  CircleTabshape.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 25/11/23.
//

import SwiftUI

struct CircleTabItem: View {
    // Constants
    private let activeImageSize: CGFloat = UIScreen.main.bounds.width * 0.13
    private let inactiveImageSize: CGFloat = UIScreen.main.bounds.width * 0.050
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
                .scaleEffect(activeTab == tab ? 1.2 : 1.0)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tab.TabColor.opacity(0.5).gradient)
                            .matchedGeometryEffect(id: "ActiveTab", in: animation)
                    }
                }


            // Tab Text
            Text(tab.rawValue)
                .font(.system(size: 12))
                .foregroundColor(activeTab == tab ? activeTab.TabColor : inactiveTextColor)
                .padding(.bottom, 30)
          
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom)
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
