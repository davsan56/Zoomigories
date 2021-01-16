//
//  CategoryList.swift
//  Scatagories
//
//  Created by David San Antonio on 1/15/21.
//

import Foundation

// MARK: - CategoryList
struct CategoryList: Codable {
    let categories: [Category]?
}

// MARK: - Category
struct Category: Codable, Identifiable {
    var id = UUID()
    let number, categoryDescription: String?

    enum CodingKeys: String, CodingKey {
        case number
        case categoryDescription = "description"
    }
}
