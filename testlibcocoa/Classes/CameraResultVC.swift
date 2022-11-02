//
//  CameraResultVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit
//import QKMRZScanner

class CameraScanResultVC: UIViewController {

    lazy var btnBack:CustomImgBTN={
        let btn = CustomImgBTN(img: IMAGES.Back!)
        btn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = .black
        return btn
    }()
    
    lazy var ImgLogo:CustomIMG={
        let img = CustomIMG(image: IMAGES.AppIcon)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lbltitle:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Camera Scan Result", color: .black, align: .center, size: 24)
        return lbl
    }()
    
    lazy var lblDocNo:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str: "Card Number")
        return lbl
    }()
    
    lazy var lblDOB:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str:"Date of Birth")
        return lbl
    }()
    
    lazy var lblExpire:UILabel={
        let lbl = UILabel()
        lbl.setCustomLBL(str:"Expiration Date")
        return lbl
    }()
    
    lazy var txtDocNo:CustomTXT={
        let txt = CustomTXT()
        txt.isEnabled = false
        return txt
    }()
    
    lazy var txtDOB:CustomTXT={
        let txt = CustomTXT()
        txt.isEnabled = false
        return txt
    }()
    
    lazy var txtExpire:CustomTXT={
        let txt = CustomTXT()
        txt.isEnabled = false
        return txt
    }()
    
    lazy var DocImg:CustomIMG={
        let img = CustomIMG(image: nil)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
  //  var ScanResult:QKMRZScanResult? = nil
    
    var kDocNumber = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SetSubViews()
        displayData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    
    func SetSubViews(){
        view.addSubview(ImgLogo)
        view.addSubview(btnBack)
        view.addSubview(lbltitle)
        view.addSubview(lblDocNo)
        view.addSubview(lblDOB)
        view.addSubview(lblExpire)
        view.addSubview(txtDocNo)
        view.addSubview(txtDOB)
        view.addSubview(txtExpire)
        view.addSubview(DocImg)
       
        
        setuplayout()
    }

    
    //MARK:- Action
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
    
    func displayData(){
        var data = UserModel.MRZResult
        if data != nil{
            if let doc = data?.documentNumber{
//                if doc.count < 9{
//                    kDocNumber = doc + "<"
//                }else{
//                    kDocNumber = doc
//                }
                
                txtDocNo.text = doc
            }
            if let dob = data?.birthdate{
               
                txtDOB.text = "\(DataModel.getDisplayDate(myDate:dob))"
            }
            if let expire = data?.expiryDate{
              
                txtExpire.text = "\(DataModel.getDisplayDate(myDate: expire))"
            }
            
            if let img = data?.documentImage{
                DocImg.image = img
            }
        }
    }

}

extension CameraScanResultVC {
    func setuplayout(){
        
        ImgLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        ImgLogo.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 60, constHeight: 60)
        
        btnBack.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: ImgLogo.centerYAnchor, top: nil, left: view.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 20, bottom: 0, right: 0))
        btnBack.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 20, constHeight: 20)
        
        lbltitle.anchorWith_TopLeftBottomRight_Padd(top: ImgLogo.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        lblDocNo.anchorWith_TopLeftBottomRight_Padd(top: lbltitle.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor,padd: .init(top: 30, left: 20, bottom: 0, right: -20))
        
        txtDocNo.anchorWith_TopLeftBottomRight_Padd(top: lblDocNo.bottomAnchor, left: lblDocNo.leadingAnchor, bottom: nil, right: lblDocNo.trailingAnchor,padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        txtDocNo.anchorWith_Height(height: nil, const: VALUES.TXT_HEIGHT)
        
        lblExpire.anchorWith_TopLeftBottomRight_Padd(top: txtDocNo.bottomAnchor, left: lblDocNo.leadingAnchor, bottom: nil, right: lblDocNo.trailingAnchor,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        txtExpire.anchorWith_TopLeftBottomRight_Padd(top: lblExpire.bottomAnchor, left: lblDOB.leadingAnchor, bottom: nil, right: lblDOB.trailingAnchor,padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        txtExpire.anchorWith_Height(height: txtDocNo.heightAnchor, const: 1)
        
        lblDOB.anchorWith_TopLeftBottomRight_Padd(top: txtExpire.bottomAnchor, left: lblDocNo.leadingAnchor, bottom: nil, right: lblDocNo.trailingAnchor,padd: .init(top: 15, left: 0, bottom: 0, right: 0))
        
        txtDOB.anchorWith_TopLeftBottomRight_Padd(top: lblDOB.bottomAnchor, left: lblDOB.leadingAnchor, bottom: nil, right: lblDOB.trailingAnchor,padd: .init(top: 5, left: 0, bottom: 0, right: 0))
        txtDOB.anchorWith_Height(height: txtDocNo.heightAnchor, const: 1)
        
        DocImg.anchorWith_TopLeftBottomRight_Padd(top: txtDOB.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 30, left: 30, bottom: 0, right: -30))
        DocImg.anchorWith_Height(height: nil, const: 200)
    }
}
