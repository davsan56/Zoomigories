//
//  DatabaseManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import Foundation
import FirebaseDatabase

class DatabaseManager {
    var ref: DatabaseReference!
    
    func getCategoryList(listNumber: Int, completion: @escaping (CategoryList?) -> (), errorHandler: @escaping () -> ()) {
        ref = Database.database().reference(fromURL: "https://scategories-default-rtdb.firebaseio.com/")
        ref.child("lists").child("\(listNumber - 1)").observeSingleEvent(of: .value, with: { (snapshot) in
            do {
                guard snapshot.exists() else {
                    errorHandler()
                    return
                }
                guard let value = snapshot.value else {
                    errorHandler()
                    return
                }
                let data = try JSONSerialization.data(withJSONObject: value)
                let decoder = JSONDecoder()
                let categoryList = try decoder.decode(CategoryList.self, from: data)
                completion(categoryList)
            } catch {
                print(error.localizedDescription)
                errorHandler()
            }
          }) { (error) in
            print(error.localizedDescription)
            errorHandler()
        }
    }
}
