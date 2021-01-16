//
//  ScategoriesGame.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct ScategoriesGame: View {
    @ObservedObject var networkManager: NetworkManager
    
    @ViewBuilder
    var body: some View {
        if networkManager.categoryList == nil {
            if networkManager.error {
                ErrorView(networkManager: networkManager)
            } else {
                LoadingView(networkManager: networkManager)
            }
        } else {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack {
                    PointsView(networkManager: networkManager)
                    ListOfCategories(networkManager: networkManager, categories: networkManager.categoryList?.categories ?? [])
                }
            })
            .navigationTitle(Text("Scategories List \(networkManager.listToLoad)"))
        }
    }
}

struct ScategoriesGame_Previews: PreviewProvider {
    static var previews: some View {
        ScategoriesGame(networkManager: NetworkManager())
    }
}
