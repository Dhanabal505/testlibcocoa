//
//  Labels.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit


extension UILabel{
    func setCustomLBL(str:String){
        self.text = str
        self.translatesAutoresizingMaskIntoConstraints=false
        self.textColor = UIColor.lightGray
        self.font = UIFont.systemFont(ofSize: 16)
        
    }
    func setCustomLabel(str:String,color:UIColor,align:NSTextAlignment,size:CGFloat){
        
        self.translatesAutoresizingMaskIntoConstraints=false
        self.text = str
        self.textAlignment = align
        self.textColor = color
        self.font = UIFont.systemFont(ofSize: size)
        self.numberOfLines = 0
    }
    
}
