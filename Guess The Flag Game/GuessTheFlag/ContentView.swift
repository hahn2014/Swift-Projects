//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Bryce Hahn on 8/14/20.
//

import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var answer = Int.random(in: 0...2) //random var between 0 and 2
    @State private var rightAns = 0
    @State private var totalAsk = 0
    @State private var showingAlert = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of " + countries[answer])
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.black)
                }
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .border(Color.gray, width: 2)
                            .shadow(color: .black, radius: 4)
                    }
                }
                HStack {
                    Text("Current Score: \(rightAns) / \(totalAsk)")
                        .foregroundColor(.white)
                    Button(action : {
                        self.reset()
                    }) {
                        Text("Reset Game")
                    }
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(scoreTitle), message: Text("Your score is \(rightAns) / \(totalAsk)"), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            }
        }
    }
    
    func flagTapped(_ number: Int) {
        if (number == answer) {
            scoreTitle = "You chose the right flag!"
            rightAns += 1
        } else {
            scoreTitle = "You chose the wrong flag"
        }
        totalAsk += 1
        showingAlert = true
    }
    
    func askQuestion() {
        countries.shuffle()
        answer = Int.random(in: 0...2)
    }
    
    func reset() {
        totalAsk = 0
        rightAns = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
