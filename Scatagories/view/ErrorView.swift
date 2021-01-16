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
            Text("Error loading Scategories")
            Divider()
            Button(action: {
                loadCategoryList()
            }) {
                Text("Retry")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding()
    }
    
    private func loadCategoryList() {
        networkManager.loadFromJson(filename: "list1")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(networkManager: NetworkManager())
    }
}
