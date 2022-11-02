//
//  CustomBtns.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit

class CustomImgBTN:UIButton{
    
    required init(img:UIImage) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints=false
        self.setImage(img, for: .normal)
        self.imageView?.contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomFormBTN:UIButton{
    
    required init(title:String) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints=false
        
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = VALUES.BTN_RADIUS
        self.backgroundColor = UIColor.black
        
        self.layer.borderWidth = 1
        self.layer.borderColor = COLOR.BORDER.cgColor
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class CustomFormBTNs:UIButton{
    
    required init(title:String,bgColor:COLORS,textColor:COLORS,radii:CGFloat) {
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        if title != ""{
            self.setTitle(title, for: .normal)
        }
        self.backgroundColor = bgColor.Identifier
        self.setTitleColor(textColor.Identifier, for: .normal)
        self.layer.cornerRadius = radii
        
        layoutSubviews()
        
        self.anchorWith_Height(height: nil, const: 50)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
           // gradientLayer.frame = bounds
        }

//        private lazy var gradientLayer: CAGradientLayer = {
//            let l = CAGradientLayer()
//            l.frame = self.bounds
//            l.colors = [COLORS.Black, COLORS.Black]
//            l.startPoint = CGPoint(x: 0, y: 0.0)
//            l.endPoint = CGPoint(x: 0.0, y: 1.0)
//            layer.insertSublayer(l, at: 0)
//            l.cornerRadius = 20
//            return l
//        }()
    
}

class CustomBTNSelect:UIButton{
    
    required init(title:String) {
        super.init(frame: .zero)
        
        
        self.setTitleColor(.black, for: .normal)
        self.translatesAutoresizingMaskIntoConstraints=false
        self.backgroundColor = .white
        self.titleLabel?.font = UIFont(name: FONT.BTN_TITLE, size: 35)
        self.contentHorizontalAlignment = .left
        self.titleEdgeInsets = UIEdgeInsets(top: -3, left: 120, bottom: 0, right: 0)
        
        self.titleLabel?.lineBreakMode = .byWordWrapping
        self.titleLabel?.numberOfLines = 2
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = VALUES.BTN_RADIUS
        
       
        self.setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
