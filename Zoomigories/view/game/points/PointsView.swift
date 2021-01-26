//
//  PointsView.swift
//  Scatagories
//
//  Created by David San Antonio on 1/16/21.
//

import SwiftUI

struct PointsView: View {
    @ObservedObject var networkManager: NetworkManager
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            Text("Total points: \(networkManager.totalPointsThisRound)")
            Spacer()
            Button(action: {
                if !networkManager.stopEditing {
                    self.showingAlert.toggle()
                } else {
                    handleSubmitPressed()
                }
            }) {
                Text("Submit")
                    .foregroundColor(.white)
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Are you sure?"), message: Text("Is the game over? You will lose your answers if you continue"), primaryButton: .cancel(Text("No")), secondaryButton: .default(Text("Yes")) {
                        self.handleSubmitPressed()})
            }
            .padding()
            .background(Color.blue)
            .cornerRadius(5)
        }
        .padding()
    }
    
    private func handleSubmitPressed() {
        networkManager.totalPoints += networkManager.totalPointsThisRound
        networkManager.totalPointsThisRound = 0
        networkManager.categoryList = nil
        
        self.mode.wrappedValue.dismiss()
    }
}

struct PointsView_Previews: PreviewProvider {
    static var previews: some View {
        PointsView(networkManager: NetworkManager())
    }
}
