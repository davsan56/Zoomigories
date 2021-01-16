//
//  HomeScreen.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Scategories!")
                    .font(.title)
                NavigationLink(destination: ScategoriesGame(networkManager: networkManager)) {
                    Text("Start game")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                Text("Total points: \(networkManager.totalPoints)")
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
