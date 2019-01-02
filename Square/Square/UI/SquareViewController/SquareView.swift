//
//  View.swift
//  SquareViev
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    private var squarePosition = Position.topLeft
    var isAnimating = false
    var isStopped = true
    
    @IBOutlet var buttonStartStop: UIButton!
    @IBOutlet var labelSquad: UILabel!
    @IBOutlet weak var baseView: UIView!
    
    override func draw(_ rect: CGRect) {
        self.subviews.first?.layer.cornerRadius = 10
        self.labelSquad.layer.cornerRadius = 10
        super.draw(rect)
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
                    self.labelSquad.frame.origin = self.point(position: self.squarePosition)
                },
                completion: { finished in
                    self.isAnimating = false
                    if finished {
                        self.squarePosition = self.squarePosition.nextPosition
                        completionHandler?(finished)
                    }
                }
            )
        }
    }
    
    func loopingMovingOfSquare() {
        if !self.isStopped {
            self.setSquarePosition(position: self.squarePosition, animated: true) { _ in
                self.loopingMovingOfSquare()
            }
        }
    }
    
    private func point(position: Position) -> CGPoint {
        let baseViewBounds = self.baseView.bounds
        var result = baseViewBounds.topLeft
        
        switch position {
        case .topLeft: break
        case .topRight:
            result = baseViewBounds.topRight
        case .bottomRight:
            result = baseViewBounds.bottomRight
        case .bottomLeft:
            result = baseViewBounds.bottomLeft
        }
        
        return result
    }
}
