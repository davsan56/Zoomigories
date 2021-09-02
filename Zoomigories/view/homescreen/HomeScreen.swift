//
//  HomeScreen.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct HomeScreen: View {
    @ObservedObject var networkManager = NetworkManager()
    @StateObject var onlineGameManager: OnlineGameManager
    
    @Binding var joinGameFromDeepLink: Bool
    
    @ViewBuilder
    var body: some View {
        NavigationView {
            VStack {
                Text("Zoomigories!")
                    .font(.title)
                    .padding(.bottom)
                NavigationLink(destination: EmptyView()) {
                    EmptyView()
                }
                NavigationLink(destination: OnlineGameViewHolder(onlineGameManager: onlineGameManager, isJoiningGame: false)) {
                    Text("Start a new game")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
                NavigationLink(destination: EmptyView()) {
                    EmptyView()
                }
                .padding(.bottom)
                NavigationLink(destination: OnlineGameViewHolder(onlineGameManager: onlineGameManager, isJoiningGame: true), isActive: $joinGameFromDeepLink) {
                    Text("Join a game")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
        }
        .onAppear(perform: {
            onlineGameManager.gameCode = ""
        })
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen(onlineGameManager: OnlineGameManager(), joinGameFromDeepLink: .constant(false))
    }
}
