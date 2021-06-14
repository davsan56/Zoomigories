//
//  NetworkManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import Foundation

class NetworkManager: ObservableObject {
    @Published var categoryList: CategoryList? = nil
    @Published var error = false
    @Published var listToLoad: Int = 1
    @Published var totalPointsThisRound: Int = 0
    @Published var totalPoints: Int = 0
    @Published var stopEditing = false
    
    let databaseManager = DatabaseManager()
    
    init(categories: CategoryList? = nil) {
        self.categoryList = categories
    }
    
    init(stopEditing: Bool) {
        self.stopEditing = stopEditing
    }
    
    func getCategoryList(listNumber: Int) {
        self.categoryList = nil
        self.error = false
        self.listToLoad = listNumber
        databaseManager.getCategoryList(listNumber: listNumber, completion: { categoryList in
            self.categoryList = categoryList
            self.error = false
        }, errorHandler: {
            self.categoryList = nil
            self.error = true
        })
    }
    
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
