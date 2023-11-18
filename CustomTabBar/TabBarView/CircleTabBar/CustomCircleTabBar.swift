//
//  CustomCircleTabBar.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 25/11/23.
//

import SwiftUI

struct CustomCircleTabBar: View {
    // Constants
    private let horizontalPadding: CGFloat = 15
    private let verticalPadding: CGFloat = -3
    private let shadowRadius: CGFloat = 5
    private let shadowOpacity: Double = 1
    private let blurRadius: CGFloat = 2
    private let springAnimation = Animation.interactiveSpring(response: 0.6,
                                                              dampingFraction: 0.7,
                                                              blendDuration: 0.7)

    @Environment(\.colorScheme) var colorScheme
    @Binding var activeTab: Tab
    @Binding var tabShapePosition: CGPoint
    @Namespace private var animation
    
    var body: some View {
            // Horizontal stack to hold tab items
            HStack(alignment: .bottom) {
                // Create a TabItem for each tab using a loop
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    CircleTabItem(tint: Color.white,
                            inactiveTint: .gray,
                            tab: tab,
                            animation: animation,
                            activeTab: $activeTab,
                            position: $tabShapePosition)
                        //.padding(.bottom, -20)
                }
            }
            // Apply padding to the horizontal stack
            .padding(.horizontal, horizontalPadding)
            //.padding(.top, verticalPadding)
            // Apply animation to the entire view
            .animation(springAnimation, value: activeTab)
        }
}


