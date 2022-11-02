//
//  CustomIMG's.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit

class CustomIMG:UIImageView{
    
    override init(image: UIImage?) {
        super.init(frame: .zero)
        
        if image != nil{
            self.image = image
        }
    
        self.translatesAutoresizingMaskIntoConstraints=false
        self.contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
