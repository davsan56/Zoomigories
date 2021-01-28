//
//  CategoriesGame.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct CategoriesGame: View {
    // Passed in from online game
    let listNumber: Int
    
    @StateObject var onlineGameManager: OnlineGameManager
    @StateObject var networkManager: NetworkManager = NetworkManager()
    
    @ViewBuilder
    var body: some View {
        VStack {
            if networkManager.categoryList == nil {
                ProgressView().progressViewStyle(CircularProgressViewStyle())
            } else {
                ZoomigoriesMainView(onlineGameManager: onlineGameManager, networkManager: networkManager)
            }
        }
        .onAppear(perform: {
            self.networkManager.getCategoryList(listNumber: listNumber)
        })
    }
}

struct ScategoriesGame_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesGame(listNumber: 1, onlineGameManager: OnlineGameManager())
    }
}
