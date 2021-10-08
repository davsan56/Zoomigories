//
//  TimerManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/17/21.
//

import Foundation

class TimerManager: ObservableObject {
    var timer: Timer = Timer()
    @Published var timeRemaining = ""
    var internalSeconds = Env.isProduction() ? 180 : 75 {
        didSet {
            timeRemaining = convertSeconds()
        }
    }
    @Published var timerDone = false
    
    init() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(subtractTimer), userInfo: nil, repeats: true)
        timeRemaining = convertSeconds()
    }
    
    func startTimer() {
        RunLoop.main.add(timer, forMode: .common)
    }
    
    @objc func subtractTimer() {
        internalSeconds -= 1
        if internalSeconds == 0 {
            timerDone = true
            timer.invalidate()
        }
    }
    
    func convertSeconds() -> String {
        let (_, m, s) = (internalSeconds / 3600, (internalSeconds % 3600) / 60, (internalSeconds % 3600) % 60)
        return ("\(m):\(String(format: "%02d", s))")
    }
}
