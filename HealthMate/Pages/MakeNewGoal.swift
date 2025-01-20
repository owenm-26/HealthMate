//
//  MyGoals.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//

import SwiftUI
import Combine
import CoreData

enum Frequency: Int16, CaseIterable, Identifiable {
    case Daily = 1
    case Weekly = 7
    case Monthly = 30
    var id: Self { self }
}

struct FormView: View {
    var moc: NSManagedObjectContext
    @State private var category: GoalType = .calories
    @State private var goalAmount: Int32 = 1
    @State private var repeats: Bool = false
    @State private var frequency: Frequency = .Daily
    @State private var startDate = Date()
    @State private var duration: Int16 = 7
    
    
    
    func makeNewGoal(category: GoalType,
                     goalAmount: Int32,
                     startDate: Date,
                     duration: Int16,
                     repeats: Bool,
                     frequency: Frequency
                     ){
        
        let newGoal = Goal(context: moc)
        newGoal.id = UUID()
        newGoal.category = category.rawValue
        newGoal.date_start = startDate
        newGoal.goal_amount = goalAmount
        newGoal.frequency = frequency.rawValue
        newGoal.duration = duration
        newGoal.repeats = repeats
        
        do{
            try moc.save()
            print("New goal saved: \(newGoal)")
        }
        catch{
            print("Failed to save new goal: \(error.localizedDescription)")
        }
    }
    
    
    var body: some View {
        NavigationStack {
            
            Form {
                GoalSettingSection(category: $category, goalAmount: $goalAmount, startDate: $startDate)
                TimeSettingSection(duration: $duration, repeats: $repeats, frequency: $frequency)
                Button(action: {makeNewGoal(category: category, goalAmount: goalAmount, startDate: startDate, duration: duration, repeats: repeats, frequency: frequency)}){
                    HStack {
                        Spacer()
                        Text("Create New Goal")
                        Spacer()
                    }
                }
                
                
                
            }
            
        }
    }
}

struct GoalSettingSection: View {
    @Binding var category: GoalType
    @Binding var goalAmount: Int32 //come back to this and set it to realistic base values for each category
    @Binding var startDate: Date
    var body: some View {
        Section("Goal Setting") {
            Picker("Category", selection: $category){
                ForEach(GoalType.allCases){ type in
                    Text("\(type.rawValue)")}
            }
            LabeledContent {
                TextField("\(category) Goal", text: Binding(
                    get: { String(goalAmount) },
                    set: { goalAmount = Int32($0) ?? 0 }
                ))
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 150)
                .multilineTextAlignment(.trailing)
                .onChange(of: goalAmount) {
                    if $0 < 0 { goalAmount = 1 }
                }
            } label: {
                Text("\(category.rawValue) Goal")
                    .font(.headline)
                    .foregroundColor(.primary)
            }
            DatePicker(
                "Date Start",
                selection: $startDate,
                displayedComponents: [.date]
            )
        }
    }
}

struct TimeSettingSection: View {
    @Binding var duration: Int16
    @Binding var repeats: Bool
    @Binding var frequency: Frequency
    
    var body: some View {
        Section("Time Window") {
            VStack{
                Stepper("Days to Complete", onIncrement: {
                    self.duration += 1
                }, onDecrement: {
                    if self.duration > 1 {
                        self.duration -= 1
                    }
                })
                Text("\(duration) \(duration == 1 ? " day" : " days")")
                
            }
            
            Toggle("Recurring", isOn: $repeats)
                
            if repeats {
                
                Picker("Frequency", selection: $frequency) {
                    ForEach(Frequency.allCases, id: \.self) { frequency in
                        Text("\(frequency == .Daily ? "Daily" : frequency == .Weekly ? "Weekly" : "Monthly")")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            }
    }
}

struct MakeNewGoal: View {
    var moc: NSManagedObjectContext
    var body: some View {
        VStack{
            Text("New Goal")
                .bold()
                .font(.largeTitle)
            FormView(moc: moc)
            Spacer()
        }
    }
}
//
//#Preview {
//    MakeNewGoal()
//}

