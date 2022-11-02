//
//  DataModel.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import NFCPassportReader
import QKMRZScanner

class DataModel{
    
   
    
    public static func getFormatedDate(myDate:Date)->String{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "YYMMdd"
        
        return dateFormatterPrint.string(from: myDate)
    }
    
    public static func getDisplayDate(myDate:Date)->String{
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd MMM YYYY"
        
        return dateFormatterPrint.string(from: myDate)
    }
    
    public static func getCurrentDate()->String{
        let date = Date()
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "yyyy-MM-dd'T'hh:mm:ss.SSS"
        return dateFormatterPrint.string(from: date)
    }
    
    //UserDefault
    
    public func setUsersdefaultLog(str:String){
        if let strS = UserDefaults.standard.value(forKey: STRING.LOG){
            let mainStr = (strS as! String) + str + "\n"
            UserDefaults.standard.set(mainStr, forKey: STRING.LOG)
        }
        else{
            UserDefaults.standard.set(str+"\n", forKey: STRING.LOG)
        }
    }
    public func getUsersDefaultLog()->String?{
        if let strS = UserDefaults.standard.value(forKey: STRING.LOG){
            return (strS as! String)
        }
        else{
            return nil
        }
    }
    public static func setUserDefault(strData:String,strKey:String){
        UserDefaults.standard.set(strData, forKey: strKey)
    }
    
    public static func getUsersDefaultLog()->String?{
        if let strS = UserDefaults.standard.value(forKey: STRING.LOG){
            return (strS as! String)
        }
        else{
            return nil
        }
    }
    
    public static func getMRZKey() -> String {
        
        var passportNumber = ""
        var dateOfBirth = ""
        var expiryDate = ""
        
        let d = UserDefaults.standard
        
        if let doc = d.value(forKey: STRING.DOC_NUMBER){
            passportNumber = doc as! String
        }
        if let dob = d.value(forKey: STRING.DOB){
            dateOfBirth = dob as! String
        }
        if let expire = d.value(forKey: STRING.EXPIRE_DATE){
            expiryDate = expire as! String
        }
        
        // Calculate checksums
        let passportNrChksum = calcCheckSum(passportNumber)
        let dateOfBirthChksum = calcCheckSum(dateOfBirth)
        let expiryDateChksum = calcCheckSum(expiryDate)
        
        let mrzKey = "\(passportNumber)\(passportNrChksum)\(dateOfBirth)\(dateOfBirthChksum)\(expiryDate)\(expiryDateChksum)"
        
        return mrzKey
    }
    
    static func calcCheckSum( _ checkString : String ) -> Int {
        let characterDict  = ["0" : "0", "1" : "1", "2" : "2", "3" : "3", "4" : "4", "5" : "5", "6" : "6", "7" : "7", "8" : "8", "9" : "9", "<" : "0", " " : "0", "A" : "10", "B" : "11", "C" : "12", "D" : "13", "E" : "14", "F" : "15", "G" : "16", "H" : "17", "I" : "18", "J" : "19", "K" : "20", "L" : "21", "M" : "22", "N" : "23", "O" : "24", "P" : "25", "Q" : "26", "R" : "27", "S" : "28","T" : "29", "U" : "30", "V" : "31", "W" : "32", "X" : "33", "Y" : "34", "Z" : "35"]
        
        var sum = 0
        var m = 0
        let multipliers : [Int] = [7, 3, 1]
        for c in checkString {
            guard let lookup = characterDict["\(c)"],
                let number = Int(lookup) else { return 0 }
            let product = number * multipliers[m]
            sum += product
            m = (m+1) % 3
        }
        
        return (sum % 10)
    }
    
}

class PassPortModel{
    
    static var PassportNo : String!
    static var PassportImage:UIImage?
    
    static var ReferenceNumber : String = String()
    
    public static func setPassportImage(img:UIImage){
        PassportImage = img
    }
    
}


class LogModel{
    
    static var CustomerID = String()
    static var PassportNo = String()
    static var AgencyId = String()
    static var IsMRZScanDone = "false"
    static var MRZScannedOn = ""
    static var IsNFCRead = "false"
    static var NFCReadOn = ""
    static var PhotoVerificationStatus = "false"
    static var PhotoVerificationOn = ""
    static var ScannedOn = ""
    static var DocumentType = ""
    static var Additional5 = String()
    static var Additional1 = String()
    
 //   static let IPAddress = FGRoute.getIPAddress()
    
    public static func resetLog(){
        PassportNo = ""
        AgencyId = ""
        IsMRZScanDone = "false"
        MRZScannedOn = ""
        IsNFCRead = "false"
        NFCReadOn = ""
        PhotoVerificationStatus = "false"
        PhotoVerificationOn = ""
        ScannedOn = ""
        DocumentType = ""
        Additional5 = ""
    }
    
//    public static func getLogData()->[String:String]{
//
//        return ["CustomerId":CustomerID,"AgencyId":AgencyId,"DeviceType":"iOS","PassportNo":PassportNo,"PhotoVerificationStatus":PhotoVerificationStatus,"ScannedOn":ScannedOn,"PhotoVerificationOn":PhotoVerificationOn,"IsMRZScanDone":IsMRZScanDone,"MRZScannedOn":
//            MRZScannedOn,"IsNFCRead":IsNFCRead,"NFCReadOn":NFCReadOn,"DocumentType":DocumentType,"IpAddress":IPAddress!,"AdditionalInfo1":"","AdditionalInfo2":"","AdditionalInfo3":"","AdditionalInfo4":"","AdditionalInfo5":Additional5]
//
//    }
    
}

class UserModel {
    static var MRZResult : QKMRZScanResult?
    static var PassportResult : NFCPassportModel?
    static var CapturedImg: UIImage!
    static var FaceCompareResult : CGFloat!
}
