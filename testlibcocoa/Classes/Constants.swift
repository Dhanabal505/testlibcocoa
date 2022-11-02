//
//  Constants.swift
//  testlibcocoa
//
//  Created by Nissi201 on 02/11/22.
//

import Foundation
import UIKit

struct VALUES{
    static let TXT_HEIGHT:CGFloat = 40
    static let DASH_BTN_HEIGHT:CGFloat = 80
    static let BTN_HEIGHT:CGFloat = 45
    static let BTN_SEL_HEIGHT:CGFloat = 120
    static let LOGO_HEIGHT:CGFloat = 120
    static let LOGO_TOP:CGFloat = 35
    static let HEADER_HEIGHT:CGFloat = 40
    
    static let BTN_RADIUS:CGFloat = 8
}

struct STRING {
    static let DOC_NUMBER = "passportNumber"
    static let DOB = "dateOfBirth"
    static let EXPIRE_DATE = "expiryDate"
    static let LOG = "log"
    static let CONNECTION_ERROR = "Unable to connect to KYC SCREEN Server"
    static let NO_DATA = "Data Not Available"
    static let SERVER_ERROR = "Server Error"
}

struct IMAGES{
    static let Back = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
    static let Applogo  = UIImage(named: "logo")
    static let AppIcon = UIImage(named: "OmanIcon")
    static let NFC = UIImage(named: "NFC")
    static let Success = UIImage(named: "Success")
    static let Fail = UIImage(named: "Fail")
    
}

struct FONT {
    static let BTN_STEP = "Lato"
    static let BTN_TITLE = "HelveticaNeue-Thin"
    
}

struct COLOR {
    static var BG = UIColor.white
    static var TEXT = UIColor.black
    static var SUB_TEXT = UIColor.lightGray
    static var BORDER = UIColor().hexToColor(hex: "#E04DDC")
    static var BTN_BG = UIColor().hexToColor(hex: "#F3C6F1")
    static var BTN_TEXT = UIColor.black
    static var IMG_LOGO = UIColor.black
    
    
    // OMAN ID
    
    static var BTN_BGs = UIColor().hexToColor(hex: "#FF6001")
}


enum COLORS{
    case White
    case Black
    case Orange
    case DarkOrange
    case LightGrey
    case Clear
    case Blue
    case CustomGreyBG
    case AppColor
    case TextColor
    case TxtFldBgrnd
    case Purple

    
    var Identifier : UIColor {
        switch self {
        case .White:
            return UIColor.white
        case .Black:
            return UIColor.black
        case .DarkOrange:
            return UIColor().hexToColor(hex: "#FF6001")
        case .Blue:
            return UIColor.blue
        case .LightGrey:
            return UIColor().hexToColor(hex:"#F1F1F1")
        case .CustomGreyBG:
            return UIColor().hexToColor(hex: "#F5F5F5")
        case .Clear:
            return UIColor.clear
        case .AppColor:
            return UIColor().hexToColor(hex: "#292839")
        case .TextColor:
            return UIColor().hexToColor(hex: "#1C3D43")
        case .TxtFldBgrnd:
            return UIColor().hexToColor(hex: "#858584")
        case .Purple:
            return UIColor().hexToColor(hex: "#522864")
        default:
            return UIColor.white
        }
    }
}

extension UIViewController {
    
    func errorHandler(error:ErrorHandler){
            switch error {
            case .connectionError:
                self.makeToast(strMessage: STRING.CONNECTION_ERROR)
                break
            case .noData:
                self.makeToast(strMessage: STRING.NO_DATA)
                break
            case .serverError:
                self.makeToast(strMessage: STRING.SERVER_ERROR)
                break
            case .dataNotFound:
                self.makeToast(strMessage: STRING.NO_DATA)
                break
            case .invalidData:
                self.makeToast(strMessage: "Invalid Data")
                break
            default:
                self.makeToast(strMessage: STRING.NO_DATA)
            }
    }
}
