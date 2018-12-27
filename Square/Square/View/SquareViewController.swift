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
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.anotherSquareView.do {
            $0.isStopped.toggle()
            $0.loopingMovingOfSquare()
        }
    }
}
