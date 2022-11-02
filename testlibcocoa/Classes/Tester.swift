//
//  Tester.swift
//  testlibcocoa
//
//  Created by Nissi201 on 31/10/22.
//

import Foundation
import Alamofire
import QKMRZScanner

public class Tester {
    public init(){}
    
    public func getprint(){
        print("Hello World Dhanabal")
    }
    
    public func Testcal(x:Int,y:Int){
        print(x+y)
    }
    
    public func MRZ(){
        NavigationModel.redirect(to: MRZVC().self)
    }
    
    
}
