//
//  Commons.swift
//  baseproject
//
//  Created by Pazandish on 1/14/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation

enum ServiceResponseStatus: String {
    case success = "SUCCESS"
    case failure = "FAILURE"
    case unauthenticated = "UNAUTHENTICATED"
    case unauthorized = "UNAUTHORIZED"
    case serverError = "SERVER_ERROR"
    case invalidData = "INVALID_DATA"
    case notSupported  = "NOT_SUPPORTED"
}

enum ContentOwnerType: String {
    case legal = "LEGAL"
    //fix me
}
enum RMItemLabelStatus: String {
    case new = "NEW"
}

enum DocumentType: String {
    case video    = "VIDEO"
    case sound    = "SOUND"
    case image    = "IMAGE"
    case book     = "BOOK"
    case app     = "APP"
    case capsule  = "CAPSULE"
    case complex  = "COMPLEX"
    case teaser = "TEASER"
    case poster = "POSTER"
    case vas = "VAS"
    case link = "LINK"
    
    func getImage() -> UIImage {
        return UIImage(named:"other_icn")!
        //        switch self {
        //        case .video:
        //            return  #imageLiteral(resourceName: "video_icon")
        //        case .sound:
        //            return  #imageLiteral(resourceName: "music_icon")
        //        case .image:
        //            return  #imageLiteral(resourceName: "image_icon")
        //// fixme
        ////        case .capsule:
        ////            <#code#>
        ////        case .complex:
        ////            <#code#>
        //
        //        default:
        //            return #imageLiteral(resourceName: "book_icon")
        //        }
    }
    
    func getString() -> String {
        switch self {
        case .book:
            return "کتاب"
        case .video:
            return "ویدیو"
        case .sound:
            return "موزیک"
        case .image:
            return "تصویری"
        case .capsule:
            return "کپسول محتوا"
        case .app:
            return "نرم افزار"
        case .complex:
            return "محصول ترکیبی"
        case .teaser:
            return "تیزر"
        case .poster:
            return "پوستر"
        case .vas:
            return "پوستر رایگان"
        case .link:
            return "لینک"
            //        default:
            //            return  "شناخته نشده"
        }
    }
}
enum ItemShowType: String {
    case downloadable = "DOWNLOADABLE"
}


enum  TransactionStatus: String {
    case paid = "PAID"
    case pending = "PENDING"
    case unknown = "UNKNOWN"
    case failed  = "FAILED"
    
    
    func getString() -> String {
        switch self {
        case .paid:
            return "پرداخت شده"
        case .pending:
            return "در حال پردازش"
        case .unknown:
            return "نا مشخص"
        case .failed:
            return "رخداد خطا"
        }
    }
}



import ObjectMapper

class VoidMappable : NVMappable {
    required init() {}
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
    }
    
}

