//
//  CustomShapedTabBar.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 25/11/23.
//

import SwiftUI

struct CustomShapedTabBar: View {
    // Constants
    private let horizontalPadding: CGFloat = 15
    private let verticalPadding: CGFloat = -15
    private let shadowRadius: CGFloat = 5
    private let shadowOpacity: Double = 1
    private let blurRadius: CGFloat = 2
    private let springAnimation = Animation.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)

    @Environment(\.colorScheme) var colorScheme
    @Binding var activeTab: Tab
    @Binding var tabShapePosition: CGPoint
    @Namespace private var animation
    
    var body: some View {
            // Horizontal stack to hold tab items
            HStack(alignment: .bottom) {
                // Create a TabItem for each tab using a loop
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    CTabItem(tint: Color.white,
                             inactiveTint: .gray,
                             tab: tab,
                             animation: animation,
                             activeTab: $activeTab,
                             position: $tabShapePosition)
                }
            }
            // Apply padding to the horizontal stack
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            // Background container to hold the tab shape
            .background(
                Group {
                    // Custom tab shape filled with the colorScheme.Type
                    TabShape(midPoint: tabShapePosition.x)
                        .fill(Color.colorSchemeBackground(colorScheme))
                        .ignoresSafeArea() // Extend the shape beyond the safe area
                    // Add shadow to the tab shape
                        .shadow(color: activeTab.TabColor, radius: shadowRadius)
                        .blur(radius: blurRadius) // Apply a blur effect to the shape
                    //.padding(.vertical, 10)
                }
            )
            // Apply animation to the entire view
            .animation(springAnimation, value: activeTab)
        }
}
