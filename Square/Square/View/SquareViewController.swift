//
//  SquareViewController.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    @IBOutlet var squareView: SquareView!
    
    public var anotherSquareView: SquareView? {
        return self.view as? SquareView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = UIView()
        
        self.view.addSubview(view)
    }

    @IBAction func buttonStartStopClick(_ sender: UIButton) {
        self.anotherSquareView?.animation()
    }
}
