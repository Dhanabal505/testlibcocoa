//
//  APIs.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit
import Alamofire

struct SERVER{
    
  
    
    static var LIVENESS = "http://185.64.25.107:5001/face_match_ios"  //"https://face.kycscreen.com/face_match_ios" // "http://3.12.252.105:5001/face_match_ios"
    
    //https://face.kycscreen.com/
}


enum ErrorHandler:Error{
    case noData
    case serverError
    case connectionError
    case invalidData
    case dataNotFound
}

class APIs{
    
    public static func livenessAPIs(image1:UIImage,image2:UIImage,completion:@escaping (Any?,ErrorHandler?)->Void){
        
        let url = try! URLRequest(url: URL(string: SERVER.LIVENESS)!, method: .post)
        
        print("\n###### URL ###### \n- \(SERVER.LIVENESS)")
        print("\n###### LIVENESS ####### \n -")
//        let loader = LoaderView()
//        loader.showLoader()
         
           let dataImage1 = image1.jpegData(compressionQuality: 0.8) //image1?.pngData() //
           let dataImage2 = image2.jpegData(compressionQuality: 0.8) //image2?.pngData() //
           
           var formData: MultipartFormData?
           
           var mime = "image/*jpg"
           
           Alamofire.upload(
               multipartFormData: { multipartFormData in
                   multipartFormData.append(dataImage1!, withName: "file1", fileName: "filename1.jpg", mimeType: mime)
                   multipartFormData.append(dataImage2!, withName: "file2", fileName: "filename2.jpg", mimeType: mime)
                   formData = multipartFormData
           },
               with: url,
               encodingCompletion: { encodingResult in
                   switch encodingResult {
                   case .success(let upload, _, _):
                       upload.responseJSON { response in
                        //   loader.hideLoader()
                           print("\n####### RESPONSE ########\n - \(response)")
                           
                           if((response.result.value) != nil) {
                               
                               if let data = response.value as? NSDictionary{
                                    print("My Data - \(data)")
                                
                                   if let mat = data["match"] as? Int{
                                        let resp = ["match":CGFloat(mat)]
                                        completion(resp,nil)
//                                       self.showAlert(strTitle: "Match", strMessage: "\(mat)")
                                   }
                                   else if let mat = data["match"] as? String{
                                        let resp = ["match":(mat as NSString).floatValue]
                                        completion(resp,nil)
                                   }
                                   else if let mat = data["match"] as? CGFloat{
                                    print("CGFloat")
                                        let resp = ["match":mat]
                                        completion(resp,nil)
                                   }
                                   else{
                                     print("else")
                                        completion(nil,.noData)
                                    }
                               }

                               
                           } else {
                               print("Error- \(response.error?.localizedDescription)")
                                completion(response.error?.localizedDescription,nil)
//                               self.showAlert(strTitle: "Error", strMessage: response.error!.localizedDescription)
                           }
                       }
                   case .failure( _):
                       print("Error --")
                       completion(nil,.connectionError)
                       break
                   }
           }
           )
        
    }
}

