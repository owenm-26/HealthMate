//
//  MyGoals.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//

import SwiftUI
import CoreData


struct GoalCard: View {
    let goal: Goal
    let moc: NSManagedObjectContext
    
    var windowName: String {
        var name: String = ""
        if goal.repeats == true{
            if goal.duration == 7{
                name = "Weekly"
            }
            else if goal.duration == 1 {
                name = "Daily"
            }
            else if goal.duration == 30 {
                name = "Monthly"
            }
            else{
                name = "Repeating \(goal.duration)-Day"
            }
        }
        else{
            name = "\(goal.duration)-Day"
        }
        
        name += " \(goal.category ?? "Your") Goal"
        return name
    }
    

    var body: some View {
        
            HStack(alignment: .center, spacing: 20) {
                Image(systemName: "flame.circle").imageScale(.large).font(.system(size: 30))
                VStack(alignment: .leading) {
                    
                    Text(windowName)
                        .font(.headline)
                        .bold()

                    Text("XX / \(goal.goal_amount)")
                        .font(.subheadline)
                        .foregroundColor(.red)
                }
                Spacer()
                Image(systemName: "trash.fill")
                                .imageScale(.large)
                                .font(.system(size: 15))
                                .onTapGesture {
                                    moc.delete(goal)
                                    try? moc.save()
                                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .shadow(radius: 2)
        }
}

struct MyGoals: View {
    var moc: NSManagedObjectContext
    @FetchRequest(sortDescriptors: []) var userGoals: FetchedResults<Goal>
//    let goals: [UserGoal] = [
//        UserGoal(id: 1, category: .calories, goalCeiling: 500, dayWindow: 1, repeats: true),
//        UserGoal(id: 2, category: .steps, goalCeiling: 10000, dayWindow: 7, repeats: false),
//        UserGoal(id: 3, category: .steps, goalCeiling: 5, dayWindow: 1, repeats: false)
//    ]

    var body: some View {
        
        VStack(spacing: 20) {
            Text("My Goals")
                .bold()
                .font(.largeTitle)
            
            
            ForEach(userGoals, id: \.id) { goal in
                GoalCard(goal: goal, moc: moc)
                        }
            Spacer()
        }
        .padding()
    }
}



