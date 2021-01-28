//
//  User.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    let name: String
    let score: Int
    let ready: Bool
}
