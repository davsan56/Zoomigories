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
            Stepper(onIncrement: incrementStep, onDecrement: decrementStep) {
                Text("Points: \(stepperValue)")
            }
        }
        .padding([.leading, .trailing])
    }
    
    private func incrementStep() {
        stepperValue += 1
        networkManager.totalPointsThisRound += 1
    }
    
    private func decrementStep() {
        stepperValue -= 1
        networkManager.totalPointsThisRound -= 1
    }
}

struct PointStepper_Previews: PreviewProvider {
    static var previews: some View {
        PointStepper(networkManager: NetworkManager())
    }
}
