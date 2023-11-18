//
//  TabShape.swift
//  CustomTabBar
//
//  Created by Manikanta Sirumalla on 25/11/23.
//

import SwiftUI

struct TabShape: Shape {
    
    private let curveHeight: CGFloat = 25
    private let controlOffset: CGFloat = 25
    private let sideCurveOffset: CGFloat = 60

    var midPoint: CGFloat
    
    // Adding shape animation
    var animatableData: CGFloat {
        get { midPoint }
        set { midPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            // Drawing rectangle
            path.addPath(Rectangle().path(in: rect))
            
            // Upward curve
            path.move(to: CGPoint(x: midPoint - sideCurveOffset, y: 0))
            
            let to = CGPoint(x: midPoint, y: -curveHeight)
            let control1 = CGPoint(x: midPoint - controlOffset, y: 0)
            let control2 = CGPoint(x: midPoint - controlOffset, y: -curveHeight)
            
            path.addCurve(to: to, control1: control1, control2: control2)
            
            let to1 = CGPoint(x: midPoint + sideCurveOffset, y: 0)
            let control3 = CGPoint(x: midPoint + controlOffset, y: -curveHeight)
            let control4 = CGPoint(x: midPoint + controlOffset, y: 0)
            
            path.addCurve(to: to1, control1: control3, control2: control4)
        }
    }
}

