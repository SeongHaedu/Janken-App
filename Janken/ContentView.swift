//
//  ContentView.swift
//  Chapter11
//
//  Created by Kaito Narimoto on 2021/01/14.
//

import SwiftUI

struct ContentView: View {
    @State var labelText: String = "ジャンケンをしよう！"
    @State var playerHand: Int = 0
    @State var computerHand: Int = 0
    
    var body: some View {
        VStack {
            
            Computer(computerHand: $computerHand)
            
            Text(labelText)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Myhand(playerHand: $playerHand)
            
            HStack {
                Button(action: {
                    self.playerHand = 0
                    self.computerHand = chooseComputerHand()
                    self.labelText = victory(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("パー").resizable().frame(width: 100.0, height: 100.0)
                }
                Button(action: {
                    self.playerHand = 1
                    self.computerHand = chooseComputerHand()
                    self.labelText = victory(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("グー").resizable().frame(width: 100.0, height: 100.0)
                }
                Button(action: {
                    self.playerHand = 2
                    self.computerHand = chooseComputerHand()
                    self.labelText = victory(playerHand:self.playerHand, computerHand:self.computerHand)
                }) {
                    Image("チョキ").resizable().frame(width: 100.0, height: 100.0)
                }
            }
        }
    }
}

struct Myhand: View {
    
    @Binding var playerHand: Int
    
    
    var body: some View {
        if (playerHand == 0) {
            
            Image("パー").resizable().frame(width: 250.0, height: 250.0)
            
        } else if (playerHand == 1) {
            
            Image("グー").resizable().frame(width: 250.0, height: 250.0)
            
        } else if (playerHand == 2) {
            
            Image("チョキ").resizable().frame(width: 250.0, height: 250.0)
            
        }
    }
}

func chooseComputerHand() -> Int {
    let random = Int.random(in: 0..<3)
    let computerHand = random
    return computerHand
}

struct Computer: View {
    
    @Binding var computerHand: Int
    
    
    var body: some View {
        if (computerHand == 0) {
            
            Image("パー").resizable().frame(width: 250.0, height: 250.0).rotationEffect(Angle(degrees: 180))
            
        } else if (computerHand == 1) {
            
            Image("グー").resizable().frame(width: 250.0, height: 250.0).rotationEffect(Angle(degrees: 180))
            
        } else if (computerHand == 2) {
            
            Image("チョキ").resizable().frame(width: 250.0, height: 250.0).rotationEffect(Angle(degrees: 180))
            
        }
    }
}

func victory(playerHand:Int, computerHand:Int) -> String {
    var result = ""
    var playerHandTemp = playerHand
    playerHandTemp += 1
    
    if (playerHand == computerHand) {
        result = "あいこ"
    } else if (playerHand == 2 && computerHand == 0) || (playerHand == 0 && computerHand == 1) || (playerHand == 1 && computerHand == 2) {
        result = "あなたの勝ち"
    } else {
        result = "あなたの負け";
    }
    
    return result
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


