//
//  ScategoriesTextField.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct ScategoriesTextField: View {
    @ObservedObject var networkManager: NetworkManager
    
    let category: Category
    
    @State private var text: String = ""
    @State private var points: String = "0"
    
    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                Text("\(category.number ?? "").")
                TextField(category.categoryDescription ?? "", text: $text)
                TextField("Points", text: $points)
                    .keyboardType(.numberPad)
                    .fixedSize()
                    .onChange(of: points, perform: { value in
                        networkManager.totalPointsThisRound += Int(value) ?? 0
                    })
            }
                .padding()
            Divider()
        }
    }
}

struct ScategoriesTextField_Previews: PreviewProvider {
    static var previews: some View {
        ScategoriesTextField(networkManager: NetworkManager(), category: Category(number: "1", categoryDescription: "Monster/Villian"))
    }
}
