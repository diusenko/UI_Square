//
//  View.swift
//  SquareViev
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    typealias Position = CGRect.Position
    
    struct Strings {
        
        static let stop = "Stop"
        static let start = "Start"
    }
    
    @IBOutlet var buttonStartStop: UIButton?
    @IBOutlet var baseView: UIView?
    @IBOutlet var square: CornerView?
    
    private(set) var isAnimating = false
    private(set) var isStopped = true
    
    private var squarePosition = Position.topLeft
    private var safeArea = CGRect.zero
    
    private let trajectory = InfiniteSecuenceGenerator(Position.topLeft,
        .topRight,
        .bottomRight,
        .bottomLeft
    )
    
    // question about class IBDesignable
    override func layoutSubviews() {
        self.baseView.do {
            if let squareBounds = self.square?.bounds {
                self.safeArea = $0.bounds.cropped(
                    right: squareBounds.width,
                    bottom: squareBounds.height
                )
            }
        }
    }
    
    func setSquarePosition(position: Position) {
        self.setSquarePosition(position: position, animated: false)
    }
    
    func setSquarePosition(position: Position, animated: Bool) {
        self.setSquarePosition(
            position: position,
            animated: animated,
            completionHandler: nil
        )
    }
    
    func setSquarePosition(
        position: Position,
        animated: Bool,
        completionHandler: ((Bool) -> ())?
    ) {
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(withDuration: animated ? 2 : 0,
                animations: {
                    self.square?.frame.origin = self.point(position: self.squarePosition)
                },
                completion: { finished in
                    self.isAnimating = false
                    if finished {
                        self.squarePosition = self.trajectory.next()
                        completionHandler?(finished)
                    }
                }
            )
        }
    }
    
    private func loopingMovingOfSquare() {
        if !self.isStopped {
            self.buttonStartStop?.setTitle(Strings.stop, for: .normal)
            self.setSquarePosition(position: self.squarePosition, animated: true) { _ in
                self.loopingMovingOfSquare()
            }
        } else {
            self.buttonStartStop?.setTitle(Strings.start, for: .normal)
        }
    }
    
    func startLoopingMoving() {
        self.isStopped.toggle()
        self.loopingMovingOfSquare()
    }
    
    private func point(position: Position) -> CGPoint {
        let safeArea = self.safeArea
        var result = safeArea.topLeft
        
        switch position {
        case .topLeft: break
        case .topRight:
            result = safeArea.topRight
        case .bottomRight:
            result = safeArea.bottomRight
        case .bottomLeft:
            result = safeArea.bottomLeft
        }
        
        return result
    }
}
