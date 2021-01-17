//
//  TimerView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import SwiftUI

struct TimerView: View {
    @StateObject var timerManager: TimerManager
    
    @ViewBuilder
    var body: some View {
        Text("Time: \(timerManager.timeRemaining)")
            .onAppear(perform: timerManager.startTimer)
            .padding([.leading])
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerManager: TimerManager())
    }
}
