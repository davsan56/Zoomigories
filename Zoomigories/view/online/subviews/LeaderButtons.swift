//
//  LeaderButtons.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct LeaderButtons: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    var body: some View {
        HStack {
            Button(action: {
                onlineGameManager.startGame(listNumber: onlineGameManager.listNumber)
            }) {
                Text("Start game")
                    .foregroundColor(onlineGameManager.areAllUsersReady ? .white : .blue)
                    .padding()
                    .background(onlineGameManager.areAllUsersReady ? Color.blue : Color.white)
                    .cornerRadius(5)
                    .border(onlineGameManager.areAllUsersReady ? Color.white : Color.blue)
            }
            .disabled(!onlineGameManager.areAllUsersReady)
            Stepper(value: $onlineGameManager.listNumber, in: 1...16) {
                Text("List: \(onlineGameManager.listNumber)")
            }
        }
    }
}

struct LeaderButtons_Previews: PreviewProvider {
    static var previews: some View {
        LeaderButtons(onlineGameManager: OnlineGameManager())
    }
}
