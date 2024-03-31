//
//  SuperHeroView.swift
//  SuperHero
//
//  Created by Mohamed Kelany on 30/03/2024.
//

import SwiftUI

struct SuperHeroView: View {
    
    var superH: Superhero
    @State var isAlertPresented: Bool = false
    @State var isScaling: Bool = false
    @State var isSliding: Bool = false
    
    var hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(superH.image)
                .resizable()
                .scaledToFill()
                .scaleEffect(isScaling == true ? 1 : 0.7)
                .animation(.easeIn(duration: 0.8), value: isScaling)
            
            VStack {
                Text(superH.title)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                
                Button {
                    isAlertPresented.toggle()
                    hapticImpact.impactOccurred()
                    playSound(sound: "chimeup", type: "mp3")
                } label: {
                    HStack {
                        Text("Start")
                            .font(.title2)
                        Image(systemName: "arrow.right.circle")
                    }.padding()
                        .background(LinearGradient(colors: superH.gradientColors, startPoint: .bottomTrailing, endPoint: .topLeading))
                        .clipShape(.capsule)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .alert(isPresented: $isAlertPresented, content: {
                            Alert(title: Text("More about \(superH.title)"), message: Text(superH.message), dismissButton: .default(Text("Ok")))
                        })
                }//: label
                
            }//: VStack
            .offset(y: isSliding == true ? 150 : 300)
            .animation(.easeOut(duration: 0.8), value: isSliding)
        }//: ZStack
        .frame(width: 335, height: 545, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(LinearGradient(colors: superH.gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(16.0)
        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2, x: 2, y: 2)
        .onAppear(perform: {
            isScaling.toggle()
            isSliding.toggle()
        })
    }
}

#Preview {
    SuperHeroView(superH: superherosData[3])
}
