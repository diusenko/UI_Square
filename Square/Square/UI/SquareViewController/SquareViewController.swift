//
//  SquareViewController.swift
//  Square
//
//  Created by Usenko Dmitry on 12/24/18.
//  Copyright © 2018 Usenko Dmitry. All rights reserved.
//

import UIKit

class SquareViewController: UIViewController, RootViewRepresentable {
    
    typealias RootView = SquareView

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onStart(_ sender: UIButton) {
        self.squareView?.startLoopingMoving()
    }
}
