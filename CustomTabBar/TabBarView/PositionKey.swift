//
//  PositionKey.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 29/08/23.
//

import SwiftUI

// A preference key to store and pass along the position of a view.
struct PositionKey: PreferenceKey {
    // Default value is set to a CGRect with zero origin and size.
    static var defaultValue: CGRect = .zero
    
    // Combine function to reduce values from multiple views.
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

// Extension to add a modifier to a View to capture its position using GeometryReader.
extension View {
    // This modifier captures the global frame of the view and invokes the completion closure.
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    // Calculate the view's frame in the global coordinate space.
                    let rect = proxy.frame(in: .global)
                    
                    // Use a transparent Color to store the position using a preference key.
                    Color.clear
                        .preference(key: PositionKey.self, value: rect)
                        .onPreferenceChange(PositionKey.self, perform: completion)
                }
            }
    }
}
