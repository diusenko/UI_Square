//
//  SquareViewController.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {

    private var isStopped = true
    
    @IBOutlet var squareView: SquareView!
    
    public var anotherSquareView: SquareView? {
        return self.view as? SquareView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonStartStopClick(_ sender: UIButton) {
        self.isStopped.toggle()
        if !self.isStopped {
            //self.buttonStartStop.setTitle("Stop", for: .normal)
            self.squareView.foo()
        } else {
            //self.buttonStartStop.setTitle("Start", for: .normal)
        }
    }
}
