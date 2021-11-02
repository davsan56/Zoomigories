//
//  ScoreboardRow.swift
//  ScoreboardRow
//
//  Created by David San Antonio on 10/8/21.
//

import SwiftUI

struct ScoreboardRow: View {
    let user: User
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(user.name)
                    .frame(maxWidth: .infinity)
                Spacer()
                Text("\(user.score)")
                    .frame(maxWidth: .infinity)
                Spacer()
                Image(systemName: user.isLeader ? "star.circle.fill" : user.ready ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(user.isLeader ? .yellow : user.ready ? .green : .red)
                    .frame(maxWidth: .infinity)
                Spacer()
            }
            Divider()
        }
    }
}

struct ScoreboardRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardRow(user: User(id: UUID(), name: "David", score: 9, ready: true, isLeader: false))
    }
}
