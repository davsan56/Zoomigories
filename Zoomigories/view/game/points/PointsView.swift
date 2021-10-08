//
//  PointsView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct PointsView: View {
    @StateObject var networkManager: NetworkManager
    
    @State private var showingAlert = false
    
    var body: some View {
        Text("Points: \(networkManager.totalPointsThisRound)")
            .padding()
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(networkManager: NetworkManager())
    }
}
