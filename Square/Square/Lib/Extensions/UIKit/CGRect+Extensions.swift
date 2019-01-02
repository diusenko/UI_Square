//
//  CGRect+Extensions.swift
//  Square
//
//  Created by Usenko Dmitry on 12/28/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

extension CGRect {
    
    var x: CGFloat {
        get { return self.origin.x }
        set { return self.origin.x = newValue }
    }
    
    var y: CGFloat {
        get { return self.origin.y }
        set { return self.origin.y = newValue }
    }
    
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
    
    var middleLeft: CGPoint {
        return CGPoint(x: self.minX, y: self.midY)
    }
    
    var middleRight: CGPoint {
        return CGPoint(x: self.maxX, y: self.midY)
    }
    
    var center: CGPoint {
        return CGPoint(x: self.midX, y: self.midY)
    }
    
    var middleTop: CGPoint {
        return CGPoint(x: self.midX, y: self.minY)
    }
    
    var middleBottom: CGPoint {
        return CGPoint(x: self.midX, y: self.maxY)
    }
}
