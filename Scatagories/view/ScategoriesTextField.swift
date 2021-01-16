//
//  ScategoriesTextField.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import SwiftUI

struct ScategoriesTextField: View {
    let category: Category
    @State private var text: String = ""
    
    @ViewBuilder
    var body: some View {
        VStack {
            HStack {
                Text("\(category.number ?? "").")
                TextField(category.categoryDescription ?? "", text: $text)
            }
                .padding()
            Divider()
        }
    }
}

struct ScategoriesTextField_Previews: PreviewProvider {
    static var previews: some View {
        ScategoriesTextField(category: Category(number: "1", categoryDescription: "Monster/Villian"))
    }
}
