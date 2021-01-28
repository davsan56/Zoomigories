//
//  Helper.swift
//  Scatagories
//
//  Created by David San Antonio on 1/28/21.
//

import Foundation

class Helper {
    static let backendUrl = "https://zoomigories.herokuapp.com/socket.io/"
}

struct Env {
    private static let production: Bool = {
        #if DEBUG
            print("DEBUG")
            let dic = ProcessInfo.processInfo.environment
            if let forceProduction = dic["forceProduction"], forceProduction == "true" {
                return true
            }
            return false
        #elseif ADHOC
            print("ADHOC")
            return false
        #else
            print("PRODUCTION")
            return true
        #endif
    }()
    
    static func isProduction () -> Bool {
        return self.production
    }
}
