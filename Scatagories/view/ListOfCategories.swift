//
//  ListOfCategories.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct ListOfCategories: View {
    @ObservedObject var networkManager: NetworkManager
    var categories: [Category]
    
    var body: some View {
        VStack {
            ForEach(categories) { category in
                ScategoriesTextField(networkManager: networkManager, category: category)
            }
        }
    }
}

struct ListOfCategories_Previews: PreviewProvider {
    static var previews: some View {
        ListOfCategories(networkManager: NetworkManager(), categories: [
            Category(number: "1", categoryDescription: "Monster/Villian")
        ])
    }
}
