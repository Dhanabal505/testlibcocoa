//
//  Extensions.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit
import Toast_Swift


public extension UIViewController{
    
    

    public func setNavigation(){
        NavigationModel.vcViewModel = self
        NavigationModel.setNavController(vc: self)
        setBackground()
    }
    
    public func setBackground(){
        
        self.view.backgroundColor = COLOR.BG
    }

    public func setTapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap(){
        self.view.endEditing(true)
    }
    
    //MARK:- Alert Function
    public func makeToast(strMessage:String){
        var style=ToastStyle()
        style.messageAlignment = .center
        self.view.makeToast(strMessage, duration: 3.0, position: .bottom,style:style)
    }
    
    public func makeToastUpper(strMessage:String){
        var style=ToastStyle()
        style.messageAlignment = .center
        self.view.makeToast(strMessage, duration: 3.0, position: .top,style:style)
    }
    
    public func getCurrentDate()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let result = formatter.string(from: date)
        
        return result
    }
    
    public func getFormatedDate(myDate:Date)->String{
        
        let formate = DateFormatter()
        formate.dateFormat = "yyyy-MM-dd"
        
        let strDate = formate.string(from: myDate)
        return strDate
    }
    
    public func getFormatedDate(myDate:String)->String{
        
        let iFormate = DateFormatter()
        iFormate.dateFormat = "yyMMdd"
        let showDate = iFormate.date(from: myDate)
        iFormate.dateFormat = "yyyy-MM-dd"
        let result = iFormate.string(from: showDate!)
        return result
    }
    
    public func calculatTimeDifference(t1:Date)->String{
        
        let startDate = t1
        let endDate = Date()
        let calendar = Calendar.current
        let unitFlags = Set<Calendar.Component>([ .second])
        let dateComponents = calendar.dateComponents(unitFlags, from: startDate, to: endDate)
        let seconds = dateComponents.second
//        print("Seconds: \(seconds)")
        
        return "\(seconds!)"
    }
    
    public func showDoneAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let exit = UIAlertAction(title: "Exit", style: .default) { (action) in

        }
        
        alert.addAction(cancel)
        alert.addAction(exit)
        present(alert, animated: true, completion: nil)
    }
    
    public func getCurrentDateSS()->String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss-SSS"
        let result = formatter.string(from: date)
        
        return result
    }
    
    var documentsUrl: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }

    //MARK:- ErrorHandler
   
}
