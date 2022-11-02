//
//  NavigationModel.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit

public class NavigationModel{
    
    static var vcViewModel=UIViewController()
    static var navViewModel=[UIViewController]()
    
    public static func setNavController(vc:UIViewController){
        if navViewModel.last != vc{
            self.navViewModel.append(vc)
        }
    }
    public static func removeAllNavController(){
        self.navViewModel.removeAll()
    }
    
    public static func redirect(to:UIViewController){
        let vc = vcViewModel
        vc.navigationController?.pushViewController(to, animated: true)
    }
}
