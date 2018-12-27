//
//  View.swift
//  SquareViev
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {

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
    
    private var isAnimating = false
    private var squarePosition = Position.topLeft
    
    @IBOutlet weak var buttonStartStop: UIButton!
    @IBOutlet weak var labelSquad: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.subviews.first?.layer.cornerRadius = 10
        self.labelSquad.layer.cornerRadius = 10
    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(position: position, animated: false)
    }
    
    func setSquarePosition(position: Position, animated: Bool) {
        self.setSquarePosition(position: position, animated: animated, completionHandler: nil)
    }
    
    func setSquarePosition(
        position: Position,
        animated: Bool,
        completionHandler: ((Bool) -> ())?
    ) {
        //let transform = CGAffineTransform(translationX: 274, y: 0)
        //self.labelSquad.transform = transform
        UIView.setAnimationsEnabled(animated)
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(withDuration: 1,
                animations: {
                    self.labelSquad.frame.origin = position.nextPosition.coordinates
                },
                completion: { finished in
                    self.isAnimating = false
                    if finished {
                        self.squarePosition = position.nextPosition.name
                        completionHandler?(finished)
                    }
                }
            )
        }
    }
    
    func foo() {
        self.setSquarePosition(position: self.squarePosition, animated: true) { _ in
            self.foo()
        }
    }
}
