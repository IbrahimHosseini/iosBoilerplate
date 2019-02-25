//
//  Common.swift
//  chimidoni
//
//  Created by Seyed Ebrahim Hosseini on 12/31/18.
//  Copyright © 2018 sehosseini. All rights reserved.
//

enum ServiceResponseStatus:String {
    
    case success = "OK"
    case failure = "FAILURE"
    case unauthenticated = "UNAUTHENTICATED"
    case unauthorized = "UNAUTHORIZED"
    case serverError = "SERVER_ERROR"
    case invalidData = "INVALID_DATA"
    case notSupported  = "NOT_SUPPORTED"
}


enum ItemShowType:String{
    case downloadable = "DOWNLOADABLE"
}


enum  TransactionStatus:String {
    
    case paid = "PAID"
    case pending = "PENDING"
    case unknown = "UNKNOWN"
    case failed  = "FAILED"
    
    
    func getString() -> String{
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

class VoidMappable : NVMappable{
    required init() {}
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
    }
    
}



