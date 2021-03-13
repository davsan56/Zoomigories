//
//  RoundOverView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/25/21.
//

import SwiftUI

struct RoundOverView: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    @ViewBuilder
    var body: some View {
        VStack {
            Spacer()
            VStack {
                Text(onlineGameManager.gameCode)
                    .font(.title)
                if !onlineGameManager.randomLetter.isEmpty {
                    Text("Letter: \(onlineGameManager.randomLetter)")
                        .font(.headline)
                }
            }
            .padding([.bottom])
            ScoreboardView(onlineGameManager: onlineGameManager)
            Spacer()
            VStack {
                PublicButtonsView(onlineGameManager: onlineGameManager)
                if onlineGameManager.isLeader {
                    LeaderButtons(onlineGameManager: onlineGameManager)
                } else {
                    ReadyUpButton(onlineGameManager: onlineGameManager)
                }
            }
        }
        .navigationTitle("Zoomigories")
        .padding()
    }
}

struct RoundOverView_Previews: PreviewProvider {
    static var previews: some View {
        RoundOverView(onlineGameManager: OnlineGameManager(code: "ABCD", users: [User(name: "David", score: 0, ready: false, isLeader: true), User(name: "Bri", score: 1, ready: true, isLeader: false)], isLeader: false))
        RoundOverView(onlineGameManager: OnlineGameManager(code: "ABCD", users: [User(name: "David", score: 0, ready: true, isLeader: false), User(name: "Bri", score: 1, ready: false, isLeader: true)], isLeader: true))
    }
}
