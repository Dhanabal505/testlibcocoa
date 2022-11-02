//
//  CustomTxt.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit
//import SkyFloatingLabelTextField

class CustomTXT:UITextField{
    
    lazy var line:UILabel={
        let lbl = UILabel()
        lbl.backgroundColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints=false
        self.backgroundColor = COLOR.BG
        self.textColor = COLOR.TEXT
        
        
        self.addSubview(line)
        
        line.anchorWith_TopLeftBottomRight_Padd(top: bottomAnchor, left: leadingAnchor, bottom: nil, right: trailingAnchor)
        line.anchorWith_Height(height: nil, const: 1)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

