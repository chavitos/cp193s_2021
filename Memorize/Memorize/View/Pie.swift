//
//  Pie.swift
//  Memorize
//
//  Created by Tiago Chaves on 09/02/23.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startPoint = CGPoint(x: center.x + radius * cos(startAngle.radians),
                                 y: center.y + radius * sin(startAngle.radians))
        
        var path = Path()
        path.move(to: center)
        path.addLine(to: startPoint)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: !clockwise)
        path.addLine(to: center)
        
        return path
    }
}
