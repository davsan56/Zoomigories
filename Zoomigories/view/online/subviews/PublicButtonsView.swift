//
//  PublicButtonsView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct PublicButtonsView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var onlineGameManager: OnlineGameManager
    
    @ViewBuilder
    var body: some View {
        HStack {
            Button(action: {
                leaveGame()
            }) {
                Text("Leave game")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
            Button(action: {
                let randomLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "S", "T", "W"]
                onlineGameManager.newRandomLetter(letter: randomLetters.randomElement() ?? "")
            }) {
                Text("Pick new letter")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
    }
    
    private func leaveGame() {
        onlineGameManager.disconnect()
        self.mode.wrappedValue.dismiss()
    }
}

struct PublicButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PublicButtonsView(onlineGameManager: OnlineGameManager())
    }
}
