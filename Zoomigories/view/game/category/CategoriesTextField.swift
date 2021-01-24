//
//  CategoriesTextField.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct CategoriesTextField: View {
    @ObservedObject var networkManager: NetworkManager
    
    let category: Category
    
    @State private var text: String = ""
    @State private var points: String = "0"
    
    @ViewBuilder
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(category.number ?? ""). \(category.categoryDescription ?? "")")
                TextField(category.categoryDescription ?? "", text: $text)
                    .overlay(
                        VStack {
                            Divider()
                                .offset(x: 0, y: 15)
                            }
                    )
                    .disabled(networkManager.stopEditing)
            }
            PointStepper(networkManager: networkManager)
        }
        .padding()
        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
        .padding()
    }
}

struct ScategoriesTextField_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesTextField(networkManager: NetworkManager(), category: Category(number: "1", categoryDescription: "short"))
    }
}
