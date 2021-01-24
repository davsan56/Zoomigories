//
//  HomeScreen.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var networkManager = NetworkManager()
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                Text("Zoomigories!")
                    .font(.title)
                NavigationLink(destination: CategoriesGame(networkManager: networkManager)) {
                    Text("Start game")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                TotalPointsView(networkManager: networkManager)
                    .padding([.top, .bottom])
                RandomLetterPicker()
//                    .padding([.leading, .trailing])
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
