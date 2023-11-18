//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 29/08/23.
//
import Foundation
import SwiftUI
import Combine

struct ScaledCustomTabBar: View {
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
                    ScaledTabItem(tint: tab.TabColor,
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

extension Color {
    // Modify this function to accept a ColorScheme parameter
    static func colorSchemeBackground(_ colorScheme: ColorScheme) -> Color {
        if colorScheme == .dark {
            return Color.black
        } else {
            return Color.white
        }
    }
}


