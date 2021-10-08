//
//  ScoreboardHeader.swift
//  ScoreboardHeader
//
//  Created by David San Antonio on 10/8/21.
//

import SwiftUI

struct ScoreboardHeader: View {
    var body: some View {
        HStack {
            Spacer()
            Text("Name")
                .bold()
            Spacer()
            Text("Score")
                .bold()
            Spacer()
            Text("Ready")
                .bold()
            Spacer()
        }
    }
}

struct ScoreboardHeader_Previews: PreviewProvider {
    static var previews: some View {
        ScoreboardHeader()
    }
}
