//
//  ContentView.swift
//  ARPlanetApp
//
//  Created by Konstantin Aldatov on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Here", destination: SecondView())
        }
       
    }
}

#Preview {
    ContentView()
}
