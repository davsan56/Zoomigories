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
                Text("Name")
                Text("Score")
                Text("Ready")
            }
            Divider()
            ForEach(onlineGameManager.users) { user in
                HStack {
                    Text(user.name)
                    Text("\(user.score)")
                    Image(systemName: user.ready ? "checkmark.circle.fill" : "xmark.circle.fill")
                }
                Divider()
            }
        }
    }
}

struct ScoreboardView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardView(onlineGameManager: OnlineGameManager(code: "ABCD", users: [User(name: "David", score: 0, ready: false), User(name: "Bri", score: 1, ready: true)], isLeader: false))
    }
}
