//
//  Modal.swift
//  Square
//
//  Created by Usenko Dmitry on 12/26/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit


enum Position {
    case topLeft
    case topRight
    case bottomRight
    case bottomLeft
    
    var nextPosition: Position {
        switch self {
        case .topLeft:
            return .topRight
        case .topRight:
            return .bottomRight
        case .bottomRight:
            return .bottomLeft
        case .bottomLeft:
            return .topLeft
        }
    }
}
