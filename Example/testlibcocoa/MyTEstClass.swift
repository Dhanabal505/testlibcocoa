//
//  MyTEstClass.swift
//  testlibcocoa_Example
//
//  Created by Nissi201 on 02/11/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import UIKit
import testlibcocoa

class MyTEstClass: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        self.view.backgroundColor = .red
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
