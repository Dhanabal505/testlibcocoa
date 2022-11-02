//
//  DetailVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit
import NFCPassportReader
import QKMRZScanner

class DetailVC: UIViewController {
    
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
        lbl.setCustomLabel(str: "NFC Extracted Result", color: .black, align: .center, size: 24)
        return lbl
    }()
    
    lazy var myScroll:UIScrollView={
        let sc = UIScrollView()
        sc.translatesAutoresizingMaskIntoConstraints=false
        sc.contentSize.height = 1080
        return sc
    }()
    
    lazy var imgPhoto:UIImageView={
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints=false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named:"head")
        return img
    }()
    
    lazy var lblFirstname:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "First Name", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblLastname:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Last Name", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblGender:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Gender", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblCountry:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Country", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblNationality:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Nationality", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblDOB:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Date of Birth", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblExpiryDate:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Date of Issue", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    lazy var lblPlaceofresid:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblPersonalNum:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblOrigin:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblIssueAuthoprity:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Issue Authority", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblCitizenPID:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblFName:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblMName:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblEthnic:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblReligion:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblWName:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()

    lazy var lblHName:UILabel={
        let lbl = UILabel()
         lbl.setCustomLabel(str: "", color: .black, align: .center, size: 18)
        return lbl
    }()
    
    var PassportDetail:NFCPassportModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubview()
        displayData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
        
        myScroll.contentSize.height = 780
    
    }
    
    func setSubview(){
        view.addSubview(ImgLogo)
        view.addSubview(btnBack)
        view.addSubview(lbltitle)
        view.addSubview(myScroll)
        myScroll.addSubview(imgPhoto)
        myScroll.addSubview(lblFirstname)
        myScroll.addSubview(lblLastname)
        myScroll.addSubview(lblGender)
        myScroll.addSubview(lblCountry)
        myScroll.addSubview(lblNationality)
        myScroll.addSubview(lblDOB)
        myScroll.addSubview(lblExpiryDate)
        myScroll.addSubview(lblPlaceofresid)
        myScroll.addSubview(lblPersonalNum)
        myScroll.addSubview(lblOrigin)
        myScroll.addSubview(lblIssueAuthoprity)
        myScroll.addSubview(lblCitizenPID)
        myScroll.addSubview(lblFName)
        myScroll.addSubview(lblMName)
        myScroll.addSubview(lblEthnic)
        myScroll.addSubview(lblReligion)
        myScroll.addSubview(lblWName)
        myScroll.addSubview(lblHName)
        
    
        setupLayout()
    }
    
    func displayData(){
        var content = "Record Not Found"
        self.PassportDetail = UserModel.PassportResult
        if PassportDetail != nil{
            
            myScroll.contentSize.height = 1200
            
            if let myImage = PassportDetail?.passportImage{
                imgPhoto.image = myImage
                PassPortModel.setPassportImage(img: myImage)
            }
            else{
                imgPhoto.image = UIImage(named:"head")
            }
            
            if let docNo = PassportDetail?.documentNumber{
                PassPortModel.PassportNo = docNo
            }
            
            if let str = PassportDetail?.issuingAuthority{
                lblIssueAuthoprity.text = "Issue Authority  \(str)"
            }
            
            if let str = PassportDetail?.lastName{
                lblLastname.text = "Last Name   \(str)"
            }
            if let str = PassportDetail?.firstName{
                lblFirstname.text = "First Name  \(str)"
            }
            if let str = PassportDetail?.dateOfBirth{
                lblDOB.text = "Date of Birth\(self.getFormatedDate(myDate: str))"
            }
            if let str = PassportDetail?.documentExpiryDate{
                lblExpiryDate.text = "Date of Issue \(self.getFormatedDate(myDate: str))"
            }
            if let str = PassportDetail?.nationality{
                lblNationality.text = "Nationality  \(str)"
                lblCountry.text = "Country  \(str)"
            }
            if let str = PassportDetail?.gender{
                var gender = "Male"
                if str == "F"{
                    gender = "Female"
                }
                lblGender.text = "Gender  \(gender)"

            }
        }
        else{
            imgPhoto.image = UIImage(named:"head")
        }
        
        
    }
    
    //MARK:- Action
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
}

extension DetailVC{
    func setupLayout(){
        
        ImgLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        ImgLogo.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 60, constHeight: 60)
        
        btnBack.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: ImgLogo.centerYAnchor, top: nil, left: view.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 20, bottom: 0, right: 0))
        btnBack.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 20, constHeight: 20)
        
        lbltitle.anchorWith_TopLeftBottomRight_Padd(top: ImgLogo.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        myScroll.anchorWith_TopLeftBottomRight_Padd(top: lbltitle.bottomAnchor, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        
        imgPhoto.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: myScroll.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        imgPhoto.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 150, constHeight: 150)
        
        lblFirstname.anchorWith_TopLeftBottomRight_Padd(top: imgPhoto.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor,padd: .init(top: 40, left: 10, bottom: 0, right: -10))
        
        lblLastname.anchorWith_TopLeftBottomRight_Padd(top: lblFirstname.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblGender.anchorWith_TopLeftBottomRight_Padd(top: lblLastname.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblCountry.anchorWith_TopLeftBottomRight_Padd(top: lblGender.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblNationality.anchorWith_TopLeftBottomRight_Padd(top: lblCountry.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblDOB.anchorWith_TopLeftBottomRight_Padd(top: lblNationality.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblExpiryDate.anchorWith_TopLeftBottomRight_Padd(top: lblDOB.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
        
        lblIssueAuthoprity.anchorWith_TopLeftBottomRight_Padd(top: lblExpiryDate.bottomAnchor, left: lblFirstname.leadingAnchor, bottom: nil, right: lblFirstname.trailingAnchor, padd: .init(top: 25, left: 0, bottom: 0, right: 0))
    }
}
