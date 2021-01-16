//
//  PointsView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct PointsView: View {
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        HStack {
            Text("Total points: \(networkManager.totalPointsThisRound)")
            Spacer()
            Button(action: {
                networkManager.totalPoints += networkManager.totalPointsThisRound
                networkManager.totalPointsThisRound = 0
                networkManager.categoryList = nil
            }) {
                Text("Submit")
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding()
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(networkManager: NetworkManager())
    }
}
