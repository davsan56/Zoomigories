//
//  CategoriesGame.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct CategoriesGame: View {
    @ObservedObject var networkManager: NetworkManager
    @StateObject var timerManager: TimerManager = TimerManager()
    
    @ViewBuilder
    var body: some View {
        if networkManager.categoryList == nil {
            if networkManager.error {
                ErrorView(networkManager: networkManager)
            } else {
                LoadingView(networkManager: networkManager)
            }
        } else {
            ZoomigorieMainView(timerManager: timerManager, networkManager: networkManager)
        }
    }
}

struct ScategoriesGame_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesGame(networkManager: NetworkManager())
    }
}
