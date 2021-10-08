//
//  MainViewHeader.swift
//  Scatagories
//
//  Created by David San Antonio on 6/8/21.
//

import SwiftUI

struct MainViewHeader: View {
    @StateObject var timerManager: TimerManager = TimerManager()
    @StateObject var networkManager: NetworkManager
    @StateObject var onlineGameManager: OnlineGameManager
    
    var body: some View {
        HStack {
            TimerView(timerManager: timerManager)
                .alert(isPresented: $timerManager.timerDone, content: {
                    Alert(title: Text("Times up!"),
                          message: Text("Time to tally the points"),
                          dismissButton: .default(Text("OK")) {
                        disableCategoryTextFields()
                        onlineGameManager.scoring()
                    })
                })
            Spacer()
            Text("Letter: \(onlineGameManager.randomLetter)")
                .padding(.trailing)
                .font(.title)
        }
    }
        
    private func disableCategoryTextFields() {
        networkManager.stopEditing = true
    }
}

struct MainViewHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainViewHeader(networkManager: NetworkManager(), onlineGameManager: OnlineGameManager())
    }
}
