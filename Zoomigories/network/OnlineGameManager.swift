//
//  OnlineGameManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/26/21.
//

import Foundation
import SwiftUI

enum GameState {
    case EnterName
    case RoundOver
    case InProgress
    case TallyingPoints
}

class OnlineGameManager: ObservableObject {
    @Published var gameCode: String = ""
    @Published var users: [User] = []
    @Published var errorMessage: String = ""
    @Published var showNextScreen: Bool = false
    @Published var isLeader: Bool = false
    @Published var randomLetter: String = ""
    @Published var leaderSocketId: String = ""
    @Published var areAllUsersReady: Bool = false
    @Published var listNumber: Int = 1
    @Published var gameState: GameState? = .EnterName
    
    init() {
        SocketHelper.sharedInstance.setDelegate(delegate: self)
    }
    
    /// Init used soley for SwiftUI previews
    /// - Parameter code: Code to display on RoundOverView
    init(code: String = "", users: [User] = [], errorMessage: String? = "", isLeader: Bool = false, randomLetter: String = "") {
        self.gameCode = code
        self.users = users
        self.errorMessage = errorMessage ?? ""
        self.isLeader = isLeader
        self.randomLetter = randomLetter
    }
    
    // MARK: Functions called from front end
    
    func connect() {
        SocketHelper.sharedInstance.connect()
    }
    
    func disconnect() {
        self.gameState = .EnterName
        SocketHelper.sharedInstance.disconnect()
    }
    
    func startNewGame(with name: String) {
        SocketHelper.sharedInstance.startNewGame(name: name)
    }
    
    func joinGame(code: String, name: String) {
        SocketHelper.sharedInstance.joinGame(code: code, name: name)
    }
    
    func newRandomLetter(letter: String) {
        SocketHelper.sharedInstance.newRandomLetter(letter: letter)
    }
    
    func readyUp(ready: Bool) {
        SocketHelper.sharedInstance.readyUp(ready: ready)
    }
    
    func startGame(listNumber: Int) {
        SocketHelper.sharedInstance.startGame(listNumber: listNumber)
    }
    
    func submitScore(score: Int) {
        SocketHelper.sharedInstance.submitScore(score: score)
    }
    
    func scoring() {
        SocketHelper.sharedInstance.scoring()
    }
    
    // MARK: Delegate functions recieving updates from server
    
    func codeDidChange(newCode: String) {
        self.gameCode = newCode
        self.showNextScreen = true
        self.gameState = .RoundOver
    }
    
    func usersDidChange(newUsers: [User]) {
        self.users = newUsers
        self.showNextScreen = true
        self.areAllUsersReady = setAreAllUsersReady()
    }
    
    func errorMessageDidChange(message: String) {
        self.errorMessage = message
        self.showNextScreen = false
        if message.isEmpty {
            gameState = .RoundOver
        }
    }
    
    func isLeaderDidChange(value: Bool) {
        self.isLeader = value
    }
    
    func randomLetterChanged(value: String) {
        self.randomLetter = value
        self.areAllUsersReady = setAreAllUsersReady()
    }
    
    func leaderSocketIdChanged(value: String) {
        self.leaderSocketId = value
    }
    
    func listNumberChanged(value: Int) {
        self.listNumber = value
        self.gameState = .InProgress
    }
    
    // MARK: Other functions
    
    func setAreAllUsersReady() -> Bool {
        // If there is only one user, not ready
        if users.count == 1 {
            return false
        }
        
        // if a letter hasn't been picked, not ready
        if randomLetter.isEmpty {
            return false
        }
        
        // look through all the users
        for user in users {
            // If the user is the leader, skip because it doesn't matter
            if user.isLeader {
                continue
            }
            // If the user isn't ready
            if !user.ready {
                return false
            }
        }
        
        return true
    }
}
