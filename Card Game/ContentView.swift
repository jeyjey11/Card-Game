//
//  ContentView.swift
//  Card Game
//
//  Created by Romeo Dellosa on 2024-09-21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card" + String(Int.random(in: 2...14))
    @State var cpuCard = "card" + String(Int.random(in: 2...14))
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background-1")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                
                Image("war-card-game")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(playerCard)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                    }
                    Spacer()
                    VStack {
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(.white)
                        Image(cpuCard)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 150)
                    }
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    deal()
                }) {
                    Image("lol")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    VStack {
                        Text("Player Score")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        Text(String(playerScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                    VStack {
                        Text("CPU Score")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                        Text(String(cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    func deal() {
        // Randomize player card
        let playerCardValue = Int.random(in: 2...14)
        playerCard = "card" + String(playerCardValue)
        
        // Randomize CPU card
        let cpuCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpuCardValue)
        
        // Update score
        if playerCardValue > cpuCardValue {
            playerScore += 1
        } else if cpuCardValue > playerCardValue {
            cpuScore += 1
        } else {
            // When the cards are the same, add 1 to both scores
            playerScore += 1
            cpuScore += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
