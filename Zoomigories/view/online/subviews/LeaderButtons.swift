//
//  LeaderButtons.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct LeaderButtons: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    @State var stepperValue = 1
    
    var body: some View {
        HStack {
            Button(action: {
                onlineGameManager.startGame(listNumber: stepperValue)
            }) {
                Text("Start game")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            .disabled(!onlineGameManager.areAllUsersReady)
            Stepper(value: $stepperValue, in: 1...16) {
                Text("List: \(stepperValue)")
            }
        }
    }
}

struct LeaderButtons_Previews: PreviewProvider {
    static var previews: some View {
        LeaderButtons(onlineGameManager: OnlineGameManager())
    }
}
