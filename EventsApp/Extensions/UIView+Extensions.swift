//
//  UIView+Extensions.swift
//  EventsApp
//
//  Created by Arqam Owais on 10/10/2020.
//  Copyright © 2020 Arqam Owais. All rights reserved.
//

import UIKit

enum Edge {
    case left
    case top
    case right
    case bottom
}

extension UIView {
    
    func pinToSuperViewEdges(_ edges: [Edge] = [.top, .left, .right, .bottom], constant: CGFloat = 0) {
        guard let superview = superview else {
            return
        }
        edges.forEach {
            switch $0 {
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
    
}
