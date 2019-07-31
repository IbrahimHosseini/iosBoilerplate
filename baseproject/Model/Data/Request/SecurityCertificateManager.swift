//
//  SecurityCertificateManager.swift
//  baseproject
//
//  Created by Pazandish on 7/31/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import Alamofire

class SecurityCertificateManager {
    static let sharedInstance = SecurityCertificateManager()
    
    let defaultManager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [ "server ip address" : .disableEvaluation ] // use server IP address like 80.253.152.92
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        return Alamofire.SessionManager (
            configuration: configuration,
            serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
    }()
}
