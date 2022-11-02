//
//  ReadIdentifyDocVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit
import CoreNFC
import NFCPassportReader
import Combine
import QKMRZScanner

class ReadIdentifyDocVC: UIViewController {
    
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
        lbl.setCustomLabel(str: "Read identity document", color: .black, align: .center, size: 24)
        return lbl
    }()

    lazy var ImgNFC:CustomIMG={
        let img = CustomIMG(image: IMAGES.NFC)
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var lblHint:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Hold your phone near to\nNFC enabled passport", color: .black, align: .center, size: 24)
        return lbl
    }()
    
    lazy var btnRead:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "READ PASSPORT", bgColor: COLORS.DarkOrange, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handleScanNFC(_:)), for: .touchUpInside)
        return btn
    }()
    
    var ScanResult:QKMRZScanResult? = nil
    var MRZ_KEY = String()
    var passportReader = PassportReader()
    
    var kDocNumber = String()
    var kDOB = String()
    var kExpire = String()
    var PassportDetail:NFCPassportModel?
    
    var DOB = ""
    var Expiry = ""
    var CardNo = ""
    
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
        view.addSubview(ImgNFC)
        view.addSubview(lblHint)
        view.addSubview(btnRead)
        
        setuplayout()
    }

    
    //MARK:- Action
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleScanNFC(_ sender:UIButton){
        self.displayData()
    }
    
    func displayData(){
        self.ScanResult = UserModel.MRZResult
        if ScanResult != nil{
            if let doc = ScanResult?.documentNumber{
                if doc.count < 9{
                    kDocNumber = doc + "<"
                }else{
                    kDocNumber = doc
                }
                
                self.CardNo = doc
            }
            if let dob = ScanResult?.birthdate{
                kDOB = "\(DataModel.getFormatedDate(myDate:dob))"
                DOB = "\(DataModel.getDisplayDate(myDate:dob))"
            }
            if let expire = ScanResult?.expiryDate{
                kExpire = "\(DataModel.getFormatedDate(myDate: expire))"
                Expiry = "\(DataModel.getDisplayDate(myDate: expire))"
            }
            setUserDefaul()
        }
    }
    
    func setUserDefaul(){
        let strDoc = CardNo.trimmingCharacters(in: .whitespacesAndNewlines)
        let strDob = DOB.trimmingCharacters(in: .whitespacesAndNewlines)
        let strExpire = Expiry.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if strDoc.count == 0{
            self.makeToast(strMessage: "Passport Number required")
            return
        }
        if strDob.count == 0{
            self.makeToast(strMessage: "Date of Birth required")
            return
        }
        if strExpire.count == 0{
            self.makeToast(strMessage: "Expire Date required")
            return
        }
        
        DataModel.setUserDefault(strData: kDocNumber, strKey: STRING.DOC_NUMBER)
        DataModel.setUserDefault(strData: kDOB, strKey: STRING.DOB)
        DataModel.setUserDefault(strData: kExpire, strKey: STRING.EXPIRE_DATE)
        
        MRZ_KEY = DataModel.getMRZKey()
        
       
        scanPassport()
    }
    
}

extension ReadIdentifyDocVC {
    func setuplayout(){
        
        ImgLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        ImgLogo.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 60, constHeight: 60)
        
        btnBack.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: ImgLogo.centerYAnchor, top: nil, left: view.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 20, bottom: 0, right: 0))
        btnBack.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 20, constHeight: 20)
        
        lbltitle.anchorWith_TopLeftBottomRight_Padd(top: ImgLogo.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        ImgNFC.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: view.centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, padd: .init(top: -70, left: 0, bottom: 0, right: 0))
        ImgNFC.anchorWith_WidthHeight(width: view.widthAnchor, height: view.heightAnchor, constWidth: 0.5, constHeight: 0.35)
        
        lblHint.anchorWith_TopLeftBottomRight_Padd(top: ImgNFC.bottomAnchor, left: lbltitle.leadingAnchor, bottom: nil, right: lbltitle.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        lblHint.anchorWith_Height(height: nil, const: 60)
        
        btnRead.anchorWith_TopLeftBottomRight_Padd(top: nil, left: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.trailingAnchor,padd: .init(top: 0, left: 20, bottom: -50, right: -20))
        btnRead.anchorWith_Height(height: nil, const: 50)
    }
}

extension ReadIdentifyDocVC {
    func scanPassport(){
        
        //   self.setFirebaseContent(str: "NFC Start - \(MRZ_KEY)")
        
        // Set the masterListURL on the Passport Reader to allow auto passport verification
        let masterListURL = Bundle.main.url(forResource: "masterList", withExtension: ".pem")!
        
        passportReader.setMasterListURL( masterListURL )
        
        passportReader.readPassport(mrzKey: MRZ_KEY, completed: { (passport, error) in
            if let passport = passport {
                
                var allContent = ""
                
                if let ldsVersion = passport.LDSVersion as? String {
                    allContent.append("LDS Version - \(ldsVersion) \n")
                }
                
                if let groupPresent = passport.dataGroupsPresent as? [String] {
                    allContent.append("Data groups present - \(groupPresent.joined(separator: ", ")) \n")
                }
                
                if let CertificateVerified = passport.documentSigningCertificateVerified as? Bool {
                    allContent.append("Document Signing Certificate - \(CertificateVerified)\n")
                }
                
                if let CorrectlySigned = passport.passportCorrectlySigned as? Bool{
                    allContent.append("Country signing Certificate Correctly Signed- \(CorrectlySigned) \n")
                }
                
                if let DataNotTampered = passport.passportDataNotTampered as? Bool{
                    allContent.append("Data group hashes , Data not Tampered- \(DataNotTampered) \n")
                }
                
                if let SigningCertificate = passport.documentSigningCertificate?.getItemsAsDict(){
                    allContent.append("Document Certificate details - \(SigningCertificate) \n")
                }
                
                allContent.append("Data group hashe \n")
                
                for id in DataGroupId.allCases{
                    if let hash = passport.dataGroupHashes[id] {
                        
                        allContent.append("P -- \(hash.id) -- \(hash.match)  --\n")
                        allContent.append("P - SOD Hash - \(hash.sodHash) \n")
                        allContent.append("P - Computed Hash - \(hash.computedHash) \n")
                        
                    }
                }
                
                LogModel.Additional5 = allContent
                
                
                DispatchQueue.main.async {
                    self.makeToast(strMessage: "Passport Detail fetch Successfully")
                    
                    self.PassportDetail = passport
                    let vc = FaceCompareVC()
                    UserModel.PassportResult = passport
                    NavigationModel.redirect(to: vc)
                }
                
            } else {
                DispatchQueue.main.async {
                    self.makeToast(strMessage: "Oops!, Unable to fetch Document Details")
                }
                
            }
        })
    }
    
}

