//
//  MyGoals.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//

import SwiftUI

struct Goal: View {
    let goal: UserGoal
    
    var windowName: String {
        var name: String = ""
        if goal.repeats == true{
            if goal.dayWindow == 7{
                name = "Weekly"
            }
            else if goal.dayWindow == 1 {
                name = "Daily"
            }
            else if goal.dayWindow == 30 {
                name = "Monthly"
            }
        }
        else{
            name = "\(goal.dayWindow)-Day"
        }
        
        name += " \(goal.category.rawValue) Goal"
        return name
    }
    

    var body: some View {
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "flame.circle").imageScale(.large).font(.system(size: 30))
                VStack(alignment: .leading) {
                    
                    Text(windowName)
                        .font(.headline)
                        .bold()

                    Text("XX / \(goal.goalCeiling, specifier: "%.0f")")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .shadow(radius: 2)
        }
}

struct MyGoals: View {
    let goals: [UserGoal] = [
        UserGoal(id: 1, category: .calories, goalCeiling: 500, dayWindow: 1, repeats: true),
        UserGoal(id: 2, category: .steps, goalCeiling: 10000, dayWindow: 7, repeats: false),
        UserGoal(id: 3, category: .steps, goalCeiling: 5, dayWindow: 1, repeats: false)
    ]

    var body: some View {
        
        VStack(spacing: 20) {
            Text("My Goals")
                .bold()
                .font(.largeTitle)
            

            ForEach(goals, id: \.id) { goal in
                            Goal(goal: goal)
                        }
            Spacer()
        }
        .padding()
    }
}


#Preview {
    MyGoals()
}
