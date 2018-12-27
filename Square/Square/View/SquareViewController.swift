//
//  SquareViewController.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController {
    
    public var squareView: SquareView? {
        if self.isViewLoaded {
            return self.view as? SquareView
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.squareView.do {
            $0.isStopped.toggle()
            $0.loopingMovingOfSquare()
        }
    }
}
