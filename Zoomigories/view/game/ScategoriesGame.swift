//
//  ScategoriesGame.swift
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
            .navigationTitle(Text("Scategories List \(networkManager.listToLoad)"))
        }
    }
    
    private func disableCategoryTextFields() {
        networkManager.stopEditing = true
    }
}

struct ScategoriesGame_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesGame(networkManager: NetworkManager())
    }
}
