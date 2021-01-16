//
//  network.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var categoryList: CategoryList? = nil
    @Published var error = false
    
    func loadFromJson(filename: String) {
        self.error = false
        let decoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: filename, withExtension: ".json") else {
            self.categoryList = nil
            self.error = true
            return
        }
        guard let data = try? Data(contentsOf: url) else {
            self.categoryList = nil
            self.error = true
            return
        }
        guard let categoryList = try? decoder.decode(CategoryList.self, from: data) else {
            self.categoryList = nil
            self.error = true
            return
        }

        self.categoryList = categoryList
    }
}
