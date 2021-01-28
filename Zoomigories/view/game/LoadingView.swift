//
//  LoadingView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI
import Combine

struct LoadingView: View {
    @ObservedObject var networkManager: NetworkManager
    
    @State var listNumber: String = "1"
    
    var body: some View {
        VStack {
            Text("Enter List Number")
            HStack {
                TextField("List number", text: $listNumber)
                    .keyboardType(.numberPad)
                Spacer()
                Button(action: {
                    loadCategoryList()
                }) {
                    Text("Load list")
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color.blue)
                .cornerRadius(5)
            }
            Divider()
        }
        .padding()
    }
    
    private func loadCategoryList() {
        self.networkManager.listToLoad = Int(self.listNumber) ?? 1
//        networkManager.getCategoryList()
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(networkManager: NetworkManager())
    }
}
