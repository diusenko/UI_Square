//
//  View.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {

    enum Position {
        case bottomRight
        case bottomLeft
        case topRight
        case topLeft
    }
    
    private var squarePosition = Position.topLeft
    
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var labelSquad: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.buttonStart.layer.cornerRadius = 10
    }
    
    func animation() {
        print("animate")
        
        UIView.animate(withDuration: 2) {
            self.labelSquad.frame.origin = CGPoint(x: 280, y: 44)
        }
    }
    
}
