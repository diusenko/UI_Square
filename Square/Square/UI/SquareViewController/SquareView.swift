//
//  View.swift
//  SquareViev
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {
    
    @IBOutlet var baseView: BaseView?
    
    func startLoopingMoving() {
        self.baseView?.moving()
    }
}
