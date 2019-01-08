//
//  CornerView.swift
//  Square
//
//  Created by Usenko Dmitry on 1/8/19.
//  Copyright © 2019 Usenko Dmitry. All rights reserved.
//

import UIKit

@IBDesignable
class CornerView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.layer.cornerRadius }
        set { self.layer.cornerRadius = newValue }
    }
}
