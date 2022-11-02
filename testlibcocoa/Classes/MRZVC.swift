//
//  MRZVC.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import UIKit
import QKMRZScanner

public class MRZVC: UIViewController {
    
    lazy var btnBack:CustomImgBTN={
        let btn = CustomImgBTN(img: IMAGES.Back!)
        btn.addTarget(self, action: #selector(handleBack), for: .touchUpInside)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.tintColor = .white
        return btn
    }()
    
    lazy var view_scan : QKMRZScannerView={
        let view = QKMRZScannerView()
        view.translatesAutoresizingMaskIntoConstraints=false
        return view
    }()

    lazy var lblContent:UILabel={
        let lbl = UILabel()
        lbl.setCustomLabel(str: "Place your identity document\ninside the frame", color: UIColor.white, align: .center, size: 16)
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return lbl
    }()
    
    
    var DocumentType = String()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        view_scan.delegate = self
        
        
        setSubview()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        self.title = "Read Passport"
        
        setNavigation()
        view.backgroundColor = .white
        view_scan.startScanning()
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        self.title = "Back"
        view_scan.stopScanning()
    }
    
    func setSubview(){

        view.addSubview(view_scan)
        view.addSubview(btnBack)
        view.addSubview(lblContent)
        
        
        setupLayout()
    }
    
    func redirectNFC(result:QKMRZScanResult){
        
        let nfc = ReadIdentifyDocVC()
        UserModel.MRZResult = result
        navigationController?.pushViewController(nfc, animated: true)
    }
    
    
    
    //MARK:- Action
    @objc func handleBack(){
        navigationController?.popViewController(animated: true)
    }
    
}
extension MRZVC: QKMRZScannerViewDelegate{
    public func mrzScannerView(_ mrzScannerView: QKMRZScannerView, didFind scanResult: QKMRZScanResult) {
        
        print(scanResult)
        DispatchQueue.main.async {
            print("My result  - ",scanResult)
            self.redirectNFC(result: scanResult)
        }
        
    }
}

extension MRZVC{
    func setupLayout(){
        
        if #available(iOS 11.0, *) {
            btnBack.anchorWith_TopLeftBottomRight_Padd(top: view.safeAreaLayoutGuide.topAnchor, left: view.leadingAnchor, bottom: nil, right: nil,padd: .init(top: 30, left: 20, bottom: 0, right: 0))
        } else {
            // Fallback on earlier versions
        }
        btnBack.anchorWith_WidthHeight(width: nil, height: nil, constWidth: 20, constHeight: 20)
        
        view_scan.anchorWith_TopLeftBottomRight_Padd(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor,padd: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        lblContent.anchorWith_TopLeftBottomRight_Padd(top: btnBack.bottomAnchor, left: view_scan.leadingAnchor, bottom: nil, right: view_scan.trailingAnchor, padd: .init(top: 50, left: 10, bottom: 0, right: -10))
        
    }
}
