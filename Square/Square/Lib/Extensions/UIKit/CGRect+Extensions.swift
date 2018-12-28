//
//  CGRect+Extensions.swift
//  Square
//
//  Created by Usenko Dmitry on 12/28/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

extension CGRect {
    
    var topLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.minY)
    }
    
    var topRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.minY)
    }
    
    var bottomRight: CGPoint {
        return CGPoint(x: maxX, y: maxY)
    }
    
    var bottomLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.maxY)
    }
    
    var leftCenter: CGPoint {
        return CGPoint(x: self.minX, y: self.midY)
    }
    
    var rightCenter: CGPoint {
        return CGPoint(x: self.maxX, y: self.midY)
    }
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    var topCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.minY)
    }
    
    var bottomCenter: CGPoint {
        return CGPoint(x: self.midX, y: self.maxY)
    }
}
