//
//  OnlineGameViewHolder.swift
//  Scatagories
//
//  Created by David San Antonio on 1/27/21.
//

import SwiftUI

struct OnlineGameViewHolder: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @StateObject var onlineGameManager: OnlineGameManager
    
    let isJoiningGame: Bool
    
    @State private var alertIsShowing = false
    
    @ViewBuilder
    var body: some View {
        VStack {
            // Enter Name
            if onlineGameManager.gameState == .EnterName {
                EnterNameView(onlineGameManager: onlineGameManager, showEnterCodeView: isJoiningGame)
            }
            // Round over/scoreboard
            if onlineGameManager.gameState == .RoundOver {
                RoundOverView(onlineGameManager: onlineGameManager)
            }
            // Game in progress
            if onlineGameManager.gameState == .InProgress {
                CategoriesGame(listNumber: onlineGameManager.listNumber, onlineGameManager: onlineGameManager)
            }
        }
        .onAppear(perform: {
            onlineGameManager.connect()
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            if onlineGameManager.gameState == .EnterName {
                onlineGameManager.errorMessage.removeAll()
                onlineGameManager.disconnect()
                self.mode.wrappedValue.dismiss()
            } else {
                self.alertIsShowing.toggle()
            }
        }){
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        }
        .alert(isPresented: $alertIsShowing, content: {
            Alert(title: Text("Leave the game?"),
                  message: Text("Are you sure you want to leave the game?"),
                  primaryButton: .default(Text("No")),
                  secondaryButton: .destructive(Text("Yes")) {
                    onlineGameManager.disconnect()
                    self.mode.wrappedValue.dismiss()
                  }
            )
        }))
    }
}

struct OnlineGameViewHolder_Previews: PreviewProvider {
    static var previews: some View {
        OnlineGameViewHolder(onlineGameManager: OnlineGameManager(), isJoiningGame: true)
    }
}
