//
//  ScoreboardView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct ScoreboardView: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            ScoreboardHeader()
            Divider()
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(onlineGameManager.users) { user in
                    ScoreboardRow(user: user)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView(onlineGameManager:
                        OnlineGameManager(
                            code: "ABCD",
                            users: [
                                User(
                                    name: "David",
                                    score: 0,
                                    ready: false,
                                    isLeader: true),
                                User(name: "Long name",
                                     score: 1,
                                     ready: true,
                                     isLeader: false)
                            ],
                            isLeader: false)
        )
    }
}
