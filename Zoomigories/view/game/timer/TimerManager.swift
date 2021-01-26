//
//  TimerManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import Foundation

class TimerManager: ObservableObject {
    var timer: Timer? = nil
    @Published var timeRemaining = 10
    @Published var timerDone = false
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(subtractTimer), userInfo: nil, repeats: true)
    }
    
    @objc func subtractTimer() {
        timeRemaining -= 1
        if timeRemaining == 0 {
            timerDone = true
            timer?.invalidate()
        }
    }
}
