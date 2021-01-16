//
//  LoadingView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct LoadingView: View {
    @ObservedObject var networkManager: NetworkManager
    
    var body: some View {
        VStack {
            Text("Loading...")
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        .onAppear(perform: loadCategoryList)
    }
    
    private func loadCategoryList() {
        networkManager.loadFromJson(filename: "list1")
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(networkManager: NetworkManager())
    }
}
