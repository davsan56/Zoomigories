//
//  CatagoriesApp.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

@main
struct CatagoriesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}
