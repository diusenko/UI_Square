//
//  Modal.swift
//  Square
//
//  Created by Usenko Dmitry on 12/26/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

typealias SuperPosition = (name: Position, coordinates: CGPoint)

enum Position {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft
    
    var nextPosition: SuperPosition {
        switch self {
        case .topLeft:
            return (.topRight, CGPoint(x: 274, y: 0))
        case .topRight:
            return (.bottomRight, CGPoint(x: 274, y: 718))
        case .bottomRight:
            return (.bottomLeft, CGPoint(x: 0, y: 718))
        case .bottomLeft:
            return (.topLeft, CGPoint(x: 0, y: 0))
        }
    }
}
