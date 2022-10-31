//
//  ViewController.swift
//  testlibcocoa
//
//  Created by Dhanabal505 on 10/31/2022.
//  Copyright (c) 2022 Dhanabal505. All rights reserved.
//

import UIKit
import testlibcocoa

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let test = Tester()
        test.getprint()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

