//
//  ScoreboardView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct ScoreboardView: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Name")
                    .bold()
                Spacer()
                Text("Score")
                    .bold()
                Spacer()
                Text("Ready")
                    .bold()
                Spacer()
            }
            Divider()
            ForEach(onlineGameManager.users) { user in
                HStack {
                    Spacer()
                    Text(user.name)
                    Spacer()
                    Text("\(user.score)")
                    Spacer()
                    Image(systemName: user.isLeader ? "star.circle.fill" : user.ready ? "checkmark.circle.fill" : "xmark.circle.fill")
                        .foregroundColor(user.isLeader ? .yellow : user.ready ? .green : .red)
                    Spacer()
                }
                Divider()
            }
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
