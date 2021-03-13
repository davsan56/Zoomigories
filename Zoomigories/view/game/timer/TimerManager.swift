//
//  TimerManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import Foundation

class TimerManager: ObservableObject {
    var timer: Timer = Timer()
    @Published var timeRemaining = Env.isProduction() ? 180 : 10
    @Published var timerDone = false
    
    init() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(subtractTimer), userInfo: nil, repeats: true)
    }
    
    func startTimer() {
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func subtractTimer() {
        timeRemaining -= 1
        if timeRemaining == 0 {
            timerDone = true
            timer.invalidate()
        }
    }
}
