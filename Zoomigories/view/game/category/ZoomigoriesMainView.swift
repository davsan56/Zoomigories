//
//  ZoomigorieMainView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/24/21.
//

import SwiftUI

struct ZoomigoriesMainView: View {
    
    @StateObject var onlineGameManager: OnlineGameManager
    @StateObject var networkManager: NetworkManager
    
    @ViewBuilder
    var body: some View {
        VStack {
            MainViewHeader(networkManager: networkManager, onlineGameManager: onlineGameManager)
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
                VStack {
                    ListOfCategories(networkManager: networkManager, categories: networkManager.categoryList?.categories ?? [], letter: onlineGameManager.randomLetter)
                }
            })
            if networkManager.stopEditing {
                SubmitButton(networkManager: networkManager, onlineGameManager: onlineGameManager)
            }
        }
        .onAppear(perform: {
            networkManager.stopEditing = false
        })
        .navigationTitle(Text("Zoomigories List \(networkManager.listToLoad)"))
    }
    
    private func disableCategoryTextFields() {
        networkManager.stopEditing = true
    }
}

struct ZoomigorieMainView_Previews: PreviewProvider {
    static let categories = CategoryList(categories: [
        Category(number: "1", categoryDescription: "Monster/Villian"),
        Category(number: "2", categoryDescription: "An item in this room"),
        Category(number: "3", categoryDescription: "Something cold")
    ])
    
    static var previews: some View {
        ZoomigoriesMainView(onlineGameManager: OnlineGameManager(randomLetter: "H"), networkManager: NetworkManager(categories: categories))
    }
}
