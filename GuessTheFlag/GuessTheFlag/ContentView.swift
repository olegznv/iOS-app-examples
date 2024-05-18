//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Олег Зиновьев on 05.11.2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingCounter = false
    @State private var scoreTitle = ""
    @State private var scoreTitleEnd = ""
    @State private var userScore = 0
    @State private var counter = 0
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var rotateAmount = 0.0
    
    @State private var tappedOn = false
    @State private var firstFlag = false
    @State private var secondFlag = false
    @State private var thirdFlag = false
    
    @State private var number = 0
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .modifier(Title())
                
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(countries[correctAnswer])
                            .modifier(Title())
                    }
                    
                
                        Button {
                            flagTapped(number)
                            
                            
                                                        withAnimation {
                                                            rotateAmount += 360
                                                                }
                            
                        }
                            
                label: {
                    
                    if tappedOn {
                        
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
                    } else {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .transition(.opacity)
                    }
                }
                    
                    Button {
                        flagTapped(number)
                        
                        
                                                    withAnimation {
                                                                rotateAmount += 360
                                                            }
                        
                    }
                        
                label: {
                    
                    if tappedOn {
                        
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
                    } else {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .transition(.opacity)
                    }
                }
                    
                    Button {
                        flagTapped(number)
                        
                        
                                                    withAnimation {
                                                                rotateAmount += 360
                                                            }
                        
                    }
                        
                label: {
                    
                    if tappedOn {
                        
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .rotation3DEffect(.degrees(rotateAmount), axis: (x: 0, y: 1, z: 0))
                    } else {
                        Image(countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .shadow(radius: 10)
                            .shadow(radius: 10)
                            .transition(.opacity)
                    }
                }
                  
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(userScore)")
        }
        
        .alert(scoreTitleEnd, isPresented: $showingCounter) {
            Button("Ok", action: reset)
        } message: {
            Text("Your score is \(userScore)")
        }
    }
    
    
    func flagTapped(_ number: Int) {
        
        tappedOn.toggle()
        
        if number == correctAnswer && counter != 4 {
            showingScore = true
            scoreTitle = "Correct"
            userScore += 25
            
            
        } else if number != correctAnswer && counter != 4 {
            showingScore = true
            scoreTitle = "Wrong! That’s the flag of \(countries[number])"
            userScore -= 25
            
        }
    
        else if number == correctAnswer && counter == 4 {
            
            showingCounter = true
            userScore += 25
            scoreTitleEnd = "Correct! Game over"
            
            
        } else if number != correctAnswer && counter == 4 {
            showingCounter = true
            userScore -= 25
            scoreTitleEnd = "Wrong! That’s the flag of \(countries[number]). Game over"
        }
        
        
    }
        
        func askQuestion() {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            counter += 1
        }
    
    func endOfGame() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func reset() {
        counter = 0
        userScore = 0
        endOfGame()
    }
    
    
}
        
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
