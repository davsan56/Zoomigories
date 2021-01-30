//
//  CodeTextBindingManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/30/21.
//

import Foundation
import SwiftUI

/// This class is used by the code entering text field to limit character limit to 4
class CodeTextBindingManager: ObservableObject {
    @Published var code = "" {
        didSet {
            if code.count > characterLimit && oldValue.count <= characterLimit {
                code = oldValue
            }
        }
    }
    let characterLimit: Int

    init(limit: Int) {
        characterLimit = limit
    }
}
