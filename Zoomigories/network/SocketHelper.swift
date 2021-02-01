//
//  SocketManager.swift
//  Scatagories
//
//  Created by David San Antonio on 1/25/21.
//

import Foundation
import SocketIO

class SocketHelper {
    static let sharedInstance = SocketHelper()
    
    weak var delegate: OnlineGameManager?
    
    let manager: SocketManager = SocketManager(socketURL: URL(string: Helper.backendUrl)!, config: [.log(true), .compress])
    let socket: SocketIOClient!
    
    var gameCode: String = "" {
        didSet {
            delegate?.codeDidChange(newCode: gameCode)
        }
    }
    var gameUsers: [User] = [] {
        didSet {
            delegate?.usersDidChange(newUsers: gameUsers)
        }
    }
    var errorMessage: String = "" {
        didSet {
            delegate?.errorMessageDidChange(message: errorMessage)
        }
    }
    var isLeader: Bool = false {
        didSet {
            delegate?.isLeaderDidChange(value: isLeader)
        }
    }
    var letter: String = "" {
        didSet {
            delegate?.randomLetterChanged(value: letter)
        }
    }
    var leaderSocketId: String = "" {
        didSet {
            delegate?.leaderSocketIdChanged(value: leaderSocketId)
        }
    }
    var listNumber: Int = 0 {
        didSet {
            delegate?.listNumberChanged(value: listNumber)
        }
    }
    
    private init() {
        self.socket = self.manager.defaultSocket
        addHandlers()
    }
    
    func setDelegate(delegate: OnlineGameManager) {
        self.delegate = delegate
    }
    
    private func addHandlers() {
        socket.on(clientEvent: .connect) { data, ack in
            print("socket connected")
        }
        
        socket.on("gameCreated") { [self] data, ack in
            self.setGameData(data: data)
        }
        
        socket.on("userJoined") { data, ack in
            self.setGameData(data: data)
        }
        
        socket.on("newRandomLetter") { data, ack in
            guard let letter = data[0] as? String else { return }
            self.letter = letter
        }
        
        socket.on("readiedUp") { data, ack in
            self.setGameData(data: data)
        }
        
        socket.on("userDisconnected") { data, ack in
            self.setGameData(data: data)
        }
        
        socket.on(clientEvent: .error) { data, ack in
            self.errorMessage = "Could not connect"
        }
        
        socket.on("gameStarted") { data, ack in
            // Parse game data
            guard let gameData = data[0] as? [String: Any] else { return }
            
            // Parse list number
            guard let listNumber = gameData["listNumber"] as? Int else { return }
            self.listNumber = listNumber
        }
        
        socket.on("scoreUpdate") { data, ack in
            self.setGameData(data: data)
        }
        
        socket.on("nameTaken") { data, ack in
            self.errorMessage = "Name taken"
        }
        
        socket.on("invalidGame") { data, ack in
            self.errorMessage = "Bad code"
        }
    }
    
    // MARK: Functions UI can call
    
    func connect() {
        if socket.status == .notConnected || socket.status == .disconnected {
            socket.connect()
        }
    }
    
    func disconnect() {
        socket.disconnect()
    }
    
    func startNewGame(name: String) {
        socket.emit("newGame", ["name": name])
    }
    
    func joinGame(code: String, name: String) {
        socket.emit("joinGame", ["name": name, "code": code])
    }
    
    func newRandomLetter(letter: String) {
        socket.emit("newRandomLetter", ["letter": letter, "code": gameCode])
    }
    
    func readyUp(ready: Bool) {
        socket.emit("readyUp", ["code": gameCode, "isReady": ready])
    }
    
    func startGame(listNumber: Int) {
        socket.emit("startGame", ["code": gameCode, "listNumber": listNumber])
    }
    
    func submitScore(score: Int) {
        socket.emit("submittedScore", ["code": gameCode, "score": score])
    }
    
    // MARK: Other helper functions
    
    func getSocketId() -> String {
        return self.socket.sid
    }
    
    private func setGameData(data: [Any]) {
        // Parse game data
        guard let gameData = data[0] as? [String: Any] else { return }
        
        // Parse room code
        if let code = gameData["code"] as? String {
            self.gameCode = code
        }
        
        // Parse game info
        guard let gameInfo = gameData["game"] as? [String: Any] else { return }
        
        // Parse leader info
        guard let leaderId = gameInfo["leader"] as? String else { return }
        self.leaderSocketId = leaderId
        self.isLeader = leaderId == self.socket.sid
        
        // Parse letter info
        guard let letter = gameInfo["letter"] as? String else { return }
        self.letter = letter
        
        // Parse user info
        guard let users = gameInfo["users"] as? [[String: Any]] else { return }
        var allUsers: [User] = []
        // Set user list
        for user in users {
            guard let displayName = user["displayName"] as? String else { return }
            guard let score = user["score"] as? Int else { return }
            guard let ready = user["ready"] as? Bool else { return }
            guard let id = user["id"] as? String else { return }
            let gameUser = User(id: UUID(uuidString: id) ?? UUID(), name: displayName, score: score, ready: ready, isLeader: id == leaderId)
            allUsers.append(gameUser)
        }
        allUsers.sort {
            $0.score > $1.score
        }
        self.gameUsers = allUsers
    }
}
