//
//  RandomLetterPicker.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import SwiftUI

struct RandomLetterPicker: View {
    @State var randomLetter: String = ""
    
    let randomLetters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "R", "S", "T", "W"]
    
    @ViewBuilder
    var body: some View {
        HStack {
            if !randomLetter.isEmpty {
                Text("Letter: \(randomLetter)")
            }
            Button(action: {
                self.randomLetter = randomLetters.randomElement() ?? ""
            }) {
                Text("Generate random letter")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
    }
}

struct RandomLetterPicker_Previews: PreviewProvider {
    static var previews: some View {
        RandomLetterPicker()
    }
}
