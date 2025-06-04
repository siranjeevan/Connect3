//
//  AppView.swift
//  Connect3
//
//  Created by Jeevith on 5/27/25.
//

import SwiftUI

var Connect3 = connect3()
struct AppView: View {
//    @State var Player1Name  : String = "Player1"
    @State var NextPlayer  : String = "Player2🔴"
    @State var currentPlayer : String = "Player1⚫️"
    @State var message : String = ""
    @State var isWinCheck : Bool = false
    
    var body: some View {
        ZStack{
            VStack {
                Text("Connect Three Game")
                    .font(.system(size: 35, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .shadow( color : Color.black , radius: 10)
                    .padding()
                VStack
                {
                    HStack {
                        Text("Current Player : ")
                            .font(.system(size: 20, weight: .black , design: .default))
                            .padding()
                        
                        Text(currentPlayer)
                            .font(.system(size: 20, weight: .bold, design: .monospaced))
                            .padding(.horizontal , -15)
                    }
                    .offset(x : -55)
                    
                    HStack{
                        Text("Next Player Up : ")
                            .font(.system(size: 15, weight: .black , design: .default))
                            .padding()
                        
                        TextField("Player", text: $NextPlayer)
                            .font(.system(size: 13, weight: .bold, design: .default))
                            .padding(.horizontal , -15)
                    }
                    .padding(.horizontal)
                    .offset(y : -25)
                    
                }
                
                HStack
                {
                    ForEach (0..<7) { i in
                        VStack
                        {
                            ForEach (0..<6) { j in
                                Button {
                                    
                                    if !isWinCheck
                                        {
                                        if Connect3.isDraw()
                                            {
                                                if currentPlayer == "Player1⚫️"
                                                {
                                                    if Connect3.placeCoin(row: i, coin: "x") == true
                                                    {
                                                       isWinCheck =  Connect3.isWinCheck()
                                                        currentPlayer = "Player2🔴"
                                                        message = ""
                                                        NextPlayer = "Player1⚫️"
                                                    }
                                                    
                                                    else{
                                                        message = "colum is ful Try anthor place"
                                                    }
                                                    
                                                }
                                            
                                            else {
                                                
                                                    if Connect3.placeCoin(row: i, coin: "o") == true
                                                    {
                                                        isWinCheck =  Connect3.isWinCheck()
                                                        currentPlayer = "Player1⚫️"
                                                        message = ""
                                                        NextPlayer = "Player2🔴"
                                                    }
                                                    
                                                    else{
                                                        message = "colum is ful Try anthor place"
                                                    }
                                                    
                                                }
                                            }
                                        else{
                                            currentPlayer = "Player1⚫️"
                                            NextPlayer = "Player2🔴"
                                        }
                                    }
                                        
                                    } label: {
                                        Circle()
                                            .foregroundColor(Color( Connect3.boardDisplay(i : j , j : i) == "x" ? .black : Connect3.boardDisplay(i : j , j : i) == "o" ? .red :  .white))
                                            .frame(width: 40, height: 40)
                                            
                                }
                            }
                        }
                        
                    }
                }
                .padding(.top , -20)
                .padding(.horizontal)
                
                Text(message)
                    .font(.system(size: 15))
                    .fontWeight(.black)
                    .foregroundColor(.red)
                    .padding()
                
                
            }
            if isWinCheck{
                VStack {
                    Text("\(currentPlayer) your Are win the Game")
                        .onAppear {
                            currentPlayer =  currentPlayer == "Player1⚫️" ? "Player2🔴" : "Player1⚫️"
                            NextPlayer = currentPlayer == "Player1⚫️" ? "Player2🔴" : "Player1⚫️"
                        }
                        .padding()
                    
                    Button {
                        Connect3.newBoard()
                        message = ""
                        isWinCheck = false
                        currentPlayer = "Player1⚫️"
                        NextPlayer = "Player2🔴"
                    } label: {
                        Text("Play Again")
                            .fontWeight(.black)
                            
                    }

                }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.ultraThinMaterial)
                                .frame(width: 300, height: 100)
                        )
                
                
            }
            
            
                
            
        }
        .frame(maxWidth: .infinity , maxHeight: .infinity)
        .background(Color.brown.opacity(0.8))
    }
}

#Preview {
    AppView()
}
