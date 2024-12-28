//
//  ContentView.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MyGoals()
                .tabItem {
                    Label("My Goals", systemImage: "heart.circle")
                }
            MakeNewGoal()
                .tabItem {
                    Label("New Goal", systemImage: "plus.circle")
                }
            About()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }
    }
}

#Preview{
    ContentView()
}
