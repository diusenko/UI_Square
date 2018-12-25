//
//  View.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareView: UIView {

    @IBOutlet weak var buttonStart: UIButton!
    
    override func draw(_ rect: CGRect) {
        self.buttonStart.layer.cornerRadius = 10
    }
 
    
}
