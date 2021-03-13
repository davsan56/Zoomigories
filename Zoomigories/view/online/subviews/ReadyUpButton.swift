//
//  ReadyUpButton.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import SwiftUI

struct ReadyUpButton: View {
    @StateObject var onlineGameManager: OnlineGameManager
    
    @State var ready = false
    
    var body: some View {
        Button(action: {
            ready.toggle()
            onlineGameManager.readyUp(ready: ready)
        }) {
            Text("I'm \(ready ? "not" : "") ready")
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
}

struct ReadyUpButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ReadyUpButton(onlineGameManager: OnlineGameManager())
                .previewLayout(.sizeThatFits)
            ReadyUpButton(onlineGameManager: OnlineGameManager(), ready: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
