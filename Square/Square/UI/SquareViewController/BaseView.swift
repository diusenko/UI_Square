//
//  BaseView.swift
//  Square
//
//  Created by Usenko Dmitry on 1/9/19.
//  Copyright © 2019 Usenko Dmitry. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    typealias Position = CGRect.Position
    
    @IBOutlet var square: UIView?
    @IBOutlet var button: UIButton?
    
    private(set) var isAnimating = false
    private(set) var isStopped = true {
        didSet {
            let buttonTitle = oldValue ? Strings.stop: Strings.start
            self.button?.setTitle(buttonTitle, for: .normal)
        }
    }
    
    var squarePosition = Position.topLeft
    
    private let trajectory = InfiniteSecuenceGenerator(Position.topLeft,
        .topRight,
        .bottomRight,
        .bottomLeft
    )
    
    public func setSquarePosition(
        position: Position,
        animated: Bool = false,
        completionHandler: ((Bool) -> ())? = nil
    ) {
        if !self.isAnimating {
            self.isAnimating = true
            UIView.animate(withDuration: animated ? Duration.two : Duration.zero,
                animations: {
                self.square?.frame.origin = self.point(position: position)
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
        if !isStopped {
            self.setSquarePosition(position: self.squarePosition, animated: true) { _ in
                self.loopingMovingOfSquare()
            }
        }
    }
    
    public func moving() {
        self.isStopped.toggle()
        self.loopingMovingOfSquare()
    }
    
    private func point(position: Position) -> CGPoint {
        let inset = self.square.map {
            UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: $0.bounds.width,
                right: $0.bounds.height)
        } ?? .zero
        
        return self.bounds.inset(by: inset).point(position: position)
    }
}
