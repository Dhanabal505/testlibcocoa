//
//  FaceCompareVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit
//import AVFoundation
//import OZLivenessSDK

class FaceCompareVC: UIViewController {
    
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
        lbl.setCustomLabel(str: "Face Comparison", color: .black, align: .center, size: 24)
        return lbl
    }()
    
    lazy var btnMRZResult:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "Camera Scan Result", bgColor: COLORS.Purple, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handleCameraResl), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnNFCResult:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "NFC Extracted Result", bgColor: COLORS.Purple, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handleNFCResl), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnFacialResult:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "Facial Matching Result", bgColor: COLORS.Purple, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handleFaceCompResl), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnRetry:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "RETRY", bgColor: COLORS.DarkOrange, textColor: COLORS.White,radii: 10)
        btn.addTarget(self, action: #selector(handlefacecompare(sender:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var btnCancel:CustomFormBTNs={
        let btn = CustomFormBTNs(title: "Cancel", bgColor: .Clear, textColor: COLORS.Black,radii: 10)
        btn.addTarget(self, action: #selector(handlecancel), for: .touchUpInside)
        return btn
    }()
    
    var ReslLogo:CustomIMG={
        let img = CustomIMG(image: IMAGES.Success)
        img.contentMode = .scaleAspectFit
        img.isHidden = true
        return img
    }()
    
    var isfacecomparests = false
    var isfacecompareresult = false
    var imagePicker=UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        SetSubViews()
        initialLoad()
        //getlive()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigation()
    }
    
    func SetSubViews(){
        view.addSubview(ImgLogo)
        view.addSubview(btnBack)
        view.addSubview(lbltitle)
        view.addSubview(ReslLogo)
        view.addSubview(btnMRZResult)
        view.addSubview(btnNFCResult)
        view.addSubview(btnFacialResult)
        view.addSubview(btnCancel)
        view.addSubview(btnRetry)
        
        setuplayout()
    }

    func initialLoad() {
        btnNFCResult.isHidden = true
        btnMRZResult.isHidden = true
        btnFacialResult.isHidden = true
        ReslLogo.isHidden = true
        if isfacecomparests == true {
            ReslLogo.isHidden = false
            if isfacecompareresult == true {
                btnRetry.setTitle("COMPLETE", for: .normal)
                btnCancel.isHidden = true
                btnNFCResult.isHidden = false
                btnMRZResult.isHidden = false
                btnFacialResult.isHidden = false
                lbltitle.text = "Identity Verification Successful"
                ReslLogo.image = IMAGES.Success
            }else{
                btnRetry.setTitle("RETRY", for: .normal)
                btnCancel.isHidden = false
                lbltitle.text = "Identity Verification Failed!"
                ReslLogo.image = IMAGES.Fail
            }
        }else{
            lbltitle.text = "Face Comparison"
            btnRetry.setTitle("START FACE COMPARISON", for: .normal)
            btnCancel.isHidden = false
        }
    }
    
    @objc func handlefacecompare(sender:UIButton){
        if sender.titleLabel?.text == "COMPLETE" {
            self.navigationController?.pushViewController(SelectionVC().self, animated: true)
        }
//        else{
//            self.getlive()
//        }
        
    }
    
    //MARK:- Action
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCameraResl(){
        NavigationModel.redirect(to: CameraScanResultVC().self)
    }
    
    @objc func handleNFCResl(){
        NavigationModel.redirect(to: DetailVC().self)
    }

    @objc func handleFaceCompResl(){
       // NavigationModel.redirect(to: FaceCompareResultVC().self)
    }
    
    @objc func handlecancel(){
        NavigationModel.redirect(to: SelectionVC().self)
    }
    
//    func getlive(){
//
//        let actions: [OZVerificationMovement] = [.eyes]
//        do {
//            let ozLivenessVC: UIViewController = try OZSDK.createVerificationVCWithDelegate(self, actions: actions)
//            self.present(ozLivenessVC, animated: true)
//
//           } catch {
//               print(error)
//           }
//
//    }
//
//    func localLiveness(results: [OZMedia]) {
//        let loader = LoaderView()
//        loader.showLoader()
//        let analysisRequest = AnalysisRequestBuilder()
//        let analysis = Analysis.init(media: results, type: .quality, mode: .onDevice)
//        let folderMeta: [String: Any] = ["meta1": "data1"]
//        analysisRequest.addFolderMeta(folderMeta)
//        analysisRequest.addMedia(results)
//        analysisRequest.addAnalysis(analysis)
//        analysisRequest.run(scenarioProgressHandler: { state in },
//
//                            uploadProgressHandler: { (progress) in }) { (analysisResult, error) in
//
//            if analysisResult?.status == .success {
//                self.makeToast(strMessage: "Face Liveness Successful")
//                let fileManager = FileManager.default
//                let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
//                let documentDirectory = results[0].bestShotURL! as NSURL
//
//                let img1 = UserModel.PassportResult?.passportImage!
//                let data = NSData(contentsOf: results[0].bestShotURL!)
//                let img2 = UIImage(data: data! as Data)
//                UserModel.CapturedImg = img2!
//                APIs.livenessAPIs(image1: img1!, image2: img2!) { (records, error) in
//                    loader.hideLoader()
//                    self.isfacecomparests = true
//                    if error != nil{
//                        self.errorHandler(error: error!)
//                        self.isfacecompareresult = false
//                        self.initialLoad()
//                        return
//                    }
//
//                    if let message = records as? String{
//                        self.makeToast(strMessage: message)
//                        self.isfacecompareresult = false
//                        self.initialLoad()
//                        return
//                    }
//
//                    if let record = records as? [String:Any]{
//                        if let mat = record["match"] as? CGFloat{
//
//                            if mat < 0.5{
//                                self.makeToast(strMessage: "Face Comparison successful \(mat)")
//                                UserModel.FaceCompareResult = mat
//                                self.isfacecompareresult = true
//                            }
//                            else{
//                                self.isfacecompareresult = false
//                                self.makeToast(strMessage: "Face Comparison failed \(mat)")
//                            }
//                            self.initialLoad()
//                        }
//                    }
//                }
//            }else if analysisResult?.status == .declined {
//                self.makeToast(strMessage: "Face Liveness Failed")
//                loader.hideLoader()
//                self.isfacecomparests = true
//                self.isfacecompareresult = false
//                self.initialLoad()
//            }
//
//
//        }
//    }

}


extension FaceCompareVC {
    func setuplayout(){
        
        ImgLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: view.safeAreaLayoutGuide.topAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 20, left: 0, bottom: 0, right: 0))
        ImgLogo.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 60, constHeight: 60)
        
        btnBack.anchorWith_XY_TopLeftBottomRight_Padd(x: nil, y: ImgLogo.centerYAnchor, top: nil, left: view.leadingAnchor, bottom: nil, right: nil, padd: .init(top: 0, left: 20, bottom: 0, right: 0))
        btnBack.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 20, constHeight: 20)
        
        lbltitle.anchorWith_TopLeftBottomRight_Padd(top: ImgLogo.bottomAnchor, left: view.leadingAnchor, bottom: nil, right: view.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        ReslLogo.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: nil, top: lbltitle.bottomAnchor, left: nil, bottom: nil, right: nil, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        ReslLogo.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 90, constHeight: 90)
        
        btnNFCResult.anchorWith_XY_TopLeftBottomRight_Padd(x: view.centerXAnchor, y: view.centerYAnchor, top: nil, left: nil, bottom: nil, right: nil, padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        btnNFCResult.anchorWith_WidthHeight(width: view.widthAnchor, height: nil, constWidth: 0.75, constHeight: 50)
        
        btnMRZResult.anchorWith_TopLeftBottomRight_Padd(top: nil, left: btnNFCResult.leadingAnchor, bottom: btnNFCResult.topAnchor, right: btnNFCResult.trailingAnchor, padd: .init(top: 0, left: 0, bottom: -30, right: 0))
        
        btnFacialResult.anchorWith_TopLeftBottomRight_Padd(top: btnNFCResult.bottomAnchor, left: btnNFCResult.leadingAnchor, bottom: nil, right: btnNFCResult.trailingAnchor, padd: .init(top: 30, left: 0, bottom: 0, right: 0))
        
        btnCancel.anchorWith_TopLeftBottomRight_Padd(top: nil, left: btnNFCResult.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: btnNFCResult.trailingAnchor, padd: .init(top: 0, left: 0, bottom: -20, right: 0))
        
        btnRetry.anchorWith_TopLeftBottomRight_Padd(top: nil, left: btnNFCResult.leadingAnchor, bottom: btnCancel.topAnchor, right: btnNFCResult.trailingAnchor, padd: .init(top: 0, left: 0, bottom: -30, right: 0))
    }
}

//extension FaceCompareVC: OZLivenessDelegate {
//
//    func onError(status: OZVerificationStatus?) {
//        print(status)
//    }
//
//    func onOZLivenessResult(results: [OZMedia]) {
//        print(results)
//        self.localLiveness(results: results)
//    }
//
//}
