//
//  View.swift
//  Square
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
        
        var newPosition: SuperPosition {
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
    private var isStopped = true
    private var squarePosition = Position.topLeft
    
    private let topLeft = CGPoint(x: 0, y: 0)
    private let topRight = CGPoint(x: 274, y: 0)
    private let bottomRight = CGPoint(x: 274, y: 718)
    private let bottomLeft = CGPoint(x: 0, y: 718)
    
    @IBOutlet weak var buttonStartStop: UIButton!
    @IBOutlet weak var labelSquad: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.subviews.first?.layer.cornerRadius = 10
        self.labelSquad.layer.cornerRadius = 10
    }
    
    func setSquarePosition() {
        self.labelSquad.frame.origin = self.squarePosition.newPosition.coordinates
    }
    
    func setSquarePosition(duration: TimeInterval) {
        //let transform = CGAffineTransform(translationX: 274, y: 0)
        //self.labelSquad.transform = transform
        
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(withDuration: duration,
                animations: { self.setSquarePosition() },
                completion: { finished in
                    self.isAnimating = false
                    if !self.isStopped {
                        self.squarePosition = self.squarePosition.newPosition.name
                        self.setSquarePosition(duration: duration)
                    }
                }
            )
        }
    }
    
    func animation(duration: TimeInterval = 2) {
        self.isStopped.toggle()
        if !self.isStopped {
            self.buttonStartStop.setTitle("Stop", for: .normal)
            setSquarePosition(duration: duration)
        } else {
            self.buttonStartStop.setTitle("Start", for: .normal)
        }
    }
}
