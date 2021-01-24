//
//  TotalPointsView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import SwiftUI

struct TotalPointsView: View {
    @ObservedObject var networkManager: NetworkManager
    
    @ViewBuilder
    var body: some View {
        if networkManager.totalPoints != 0 {
            HStack {
                Text("Total points: \(networkManager.totalPoints)")
                Button(action: {
                    self.networkManager.totalPoints = 0
                }) {
                    Text("Clear total points")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct TotalPointsView_Previews: PreviewProvider {
    static var previews: some View {
        TotalPointsView(networkManager: NetworkManager())
    }
}
