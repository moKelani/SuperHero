//
//  ContentView.swift
//  SuperHero
//
//  Created by Mohamed Kelany on 30/03/2024.
//

import SwiftUI

struct ContentView: View {
    var superHeros: [Superhero] = superherosData
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(superHeros) { item in
                    SuperHeroView(superH: item)
                }
            }
        }//: ScrollView
        .padding(20.0)
    }
}

#Preview {
    ContentView()
}
