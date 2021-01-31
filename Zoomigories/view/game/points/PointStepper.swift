//
//  PointStepper.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct PointStepper: View {
    @ObservedObject var networkManager: NetworkManager
    @State var stepperValue: Int = 0
    
    var body: some View {
        VStack {
            Text("\(stepperValue)")
            Stepper("", value: $stepperValue, in: 0...4)
                .labelsHidden()
                .onChange(of: stepperValue) { [stepperValue] newValue in
                    if newValue > stepperValue {
                        networkManager.totalPointsThisRound += 1
                    } else {
                        networkManager.totalPointsThisRound -= 1
                    }
                }
        }
        .padding([.leading])
    }
}

struct PointStepper_Previews: PreviewProvider {
    static var previews: some View {
        PointStepper(networkManager: NetworkManager())
    }
}
