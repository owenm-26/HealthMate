//
//  ContentView.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//
import SwiftUI

// uncomment other categories once they are supported
enum GoalType: String, CaseIterable, Identifiable {
    case calories = "Calories"
    case steps = "Steps"
//    case distanceWalked = "Distance Walked"
//    case distanceRun = "Distance Run"
//    case workouts = "Workouts"
    var id: Self { self }
}

// Interface for Goal Objects
protocol GoalProtocol {
    var id: Int { get }
    var category: GoalType { get }
    var goalCeiling: Int { get }
    var dayWindow: Int {get}
    var repeats: Bool { get }
}

struct UserGoal: GoalProtocol {
    let id: Int
    let category: GoalType
    let goalCeiling: Int
    let dayWindow: Int
    let repeats: Bool
}

struct ContentView: View {
    @StateObject private var dataController = DataController()
    
    
    var body: some View {
        let context = dataController.container.viewContext
        TabView {
            MyGoals(moc:context)
                .tabItem {
                    Label("My Goals", systemImage: "heart.circle")
                }
            MakeNewGoal(moc:context)
                .tabItem {
                    Label("New Goal", systemImage: "plus.circle")
                }
            About()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
        }.environment(\.managedObjectContext, context)
    }
}

#Preview{
    ContentView()
}
