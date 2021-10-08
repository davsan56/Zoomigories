//
//  CategoriesTextField.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI
import SocketIO

struct CategoriesTextField: View {
    @ObservedObject var networkManager: NetworkManager
    
    let category: Category
    let letter: String
    
    @State private var text: String = ""
    @State private var points: String = "0"
    
    @ViewBuilder
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(category.number ?? ""). \(category.categoryDescription ?? "")")
                TextField(category.categoryDescription ?? "", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .disabled(networkManager.stopEditing)
            }
            if networkManager.stopEditing {
                PointStepper(networkManager: networkManager)
            }
        }
        .padding()
        .border(getBorderColor(), width: 3)
        .cornerRadius(5)
    }
    
    private func getBorderColor() -> Color {
        if text.isEmpty {
            return .primary
        } else {
            if text.starts(with: letter) {
                return .green
            } else {
                return .red
            }
        }
    }
}

struct ScategoriesTextField_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesTextField(networkManager: NetworkManager(stopEditing: false), category: Category(number: "2", categoryDescription: "An item in this room"), letter: "H")
    }
}
