//
//  ZoomigorieMainView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/24/21.
//

import SwiftUI

struct ZoomigorieMainView: View {
    @StateObject var timerManager: TimerManager
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
            VStack {
                HStack {
                    TimerView(timerManager: timerManager)
                        .alert(isPresented: $timerManager.timerDone, content: {
                            Alert(title: Text("Times up!"),
                                  message: Text("Time to tally the points"),
                                  dismissButton: .default(Text("OK")) {
                                    disableCategoryTextFields()
                                  })
                        })
                    PointsView(networkManager: networkManager)
                }
                ListOfCategories(networkManager: networkManager, categories: networkManager.categoryList?.categories ?? [])
            }
        })
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
        ZoomigorieMainView(timerManager: TimerManager(), networkManager: NetworkManager(categories: categories))
    }
}
