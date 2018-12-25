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
        case topLeft
        case topRight
        case bottomRight
        case bottomLeft
    }
    
    private var squarePosition = Position.topLeft
    private var isAnimating = false
    private var isStopped = true
    
    private let topLeft = CGPoint(x: 0, y: 0)
    private let topRight = CGPoint(x: 274, y: 0)
    private let bottomRight = CGPoint(x: 274, y: 718)
    private let bottomLeft = CGPoint(x: 0, y: 718)
    
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var labelSquad: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.subviews.first?.layer.cornerRadius = 10
        self.labelSquad.layer.cornerRadius = 10
        self.buttonStart.layer.cornerRadius = 10
        super.draw(rect)
    }
    
    func setSquarePosition() {
        let labelPosition: CGPoint
            switch self.squarePosition {
            case .topLeft:
                labelPosition = topRight
                self.squarePosition = .topRight
            case .topRight:
                labelPosition = bottomRight
                self.squarePosition = .bottomRight
            case .bottomRight:
                labelPosition = bottomLeft
                self.squarePosition = .bottomLeft
            case .bottomLeft:
                labelPosition = topLeft
                self.squarePosition = .topLeft
            }
            self.labelSquad.frame.origin = labelPosition
    }
    
    func setSquarePosition(duration: TimeInterval) {
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(withDuration: duration,
                animations: { self.setSquarePosition() },
                completion: { finished in
                    self.isAnimating = false
                    if !self.isStopped {
                        self.setSquarePosition(duration: duration)
                    }
                }
            )
        }
    }
    
    func animation(duration: TimeInterval = 2) {
        self.isStopped.toggle()
        
        if !self.isStopped {
            self.buttonStart.setTitle("Stop", for: .normal)
            setSquarePosition(duration: duration)
        } else {
            self.buttonStart.setTitle("Start", for: .normal)
        }
    }
}
