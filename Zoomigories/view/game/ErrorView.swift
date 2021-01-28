//
//  ErrorView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        VStack {
            Text("Error loading Zoomigories list \(self.networkManager.listToLoad)")
            Divider()
            LoadingView(networkManager: networkManager)
        }
        .padding()
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(networkManager: NetworkManager())
    }
}
