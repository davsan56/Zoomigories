//
//  SubmitButton.swift
//  Scatagories
//
//  Created by David San Antonio on 6/8/21.
//

import SwiftUI

struct SubmitButton: View {
    @StateObject var networkManager: NetworkManager
    @StateObject var onlineGameManager: OnlineGameManager
    
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.handleSubmitPressed()
        }) {
            Text("Submit \(networkManager.totalPointsThisRound) point\(networkManager.totalPointsThisRound == 1 ? "" : "s")")
                .foregroundColor(.white)
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.blue)
        .cornerRadius(5)
        .padding([.leading, .trailing], 20)
    }
    
    private func handleSubmitPressed() {
        networkManager.totalPoints += networkManager.totalPointsThisRound
        networkManager.totalPointsThisRound = 0
        networkManager.categoryList = nil
        
        onlineGameManager.submitScore(score: networkManager.totalPoints)
        onlineGameManager.gameState = .RoundOver
    }
}

struct SubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        SubmitButton(networkManager: NetworkManager(), onlineGameManager: OnlineGameManager())
    }
}
