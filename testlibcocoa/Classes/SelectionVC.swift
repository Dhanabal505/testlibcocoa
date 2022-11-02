//
//  SelectionVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit

public class SelectionVC: UIViewController {
    
    lazy var ImgLogo:CustomIMG={
        let img = CustomIMG(image: IMAGES.Applogo)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var btnRead:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "START VERIFICATION", bgColor: COLORS.DarkOrange, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        return btn
    }()
    
   
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubview()
    
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        
        setNavigation()
        self.view.backgroundColor = UIColor.white
    }
    
    public func setSubview(){
        view.addSubview(ImgLogo)
        view.addSubview(btnRead)
       
        setupLayout()
    }
    
    
    //MARK:- Action
    @objc func handleStart(){
       let start = MRZVC()
       navigationController?.pushViewController(start, animated: true)
    }
    
}

extension SelectionVC{
    func setupLayout(){
        
        if #available(iOS 11.0, *) {
            ImgLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        } else {
            // Fallback on earlier versions
        }
        ImgLogo.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.6, constHeight: 0.2)
        
        if #available(iOS 11.0, *) {
            btnRead.anchorWith_TopLeftBottomRight_Padd(top: nil, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor,padd: .init(top: 0, left: 20, bottom: -50, right: -20))
        } else {
            // Fallback on earlier versions
        }
        btnRead.anchorWith_Height(height: nil, const: 50)
    }
}
