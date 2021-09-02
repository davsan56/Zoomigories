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
    @State var joinGame: Bool = false
    @StateObject var onlineGameManager = OnlineGameManager()
    
    @ViewBuilder
    var body: some Scene {
        WindowGroup {
            HomeScreen(onlineGameManager: onlineGameManager, joinGameFromDeepLink: $joinGame)
                .onOpenURL { url in
                    self.joinGame = true
                    onlineGameManager.gameCode = url.absoluteString.components(separatedBy: "=")[1]
                }
        }
    }
}
