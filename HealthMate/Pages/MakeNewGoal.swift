//
//  MyGoals.swift
//  HealthMate
//
//  Created by Owen Mariani on 12/28/24.
//

import SwiftUI
import Combine

enum Frequency: String, CaseIterable, Identifiable {
    case Daily, Weekly, Monthly
    var id: Self { self }
}

struct FormView: View {
    @State private var category: GoalType = .calories
    @State private var goalAmount: Int = 1
    @State private var repeats: Bool = false
    @State private var frequency: Frequency = .Daily
    @State private var startDate = Date()
    @State private var duration: Int = 1
    
    
    var body: some View {
        NavigationStack {
            Form {
                GoalSettingSection(category: $category, goalAmount: $goalAmount, startDate: $startDate)
                TimeSettingSection(duration: $duration, repeats: $repeats, frequency: $frequency)
            }
            Button("Create Goal", action: {print("Goal Created: \(category)")})
        }
    }
}

struct GoalSettingSection: View {
    @Binding var category: GoalType
    @Binding var goalAmount: Int //come back to this and set it to realistic base values for each category
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
                    set: { goalAmount = Int($0) ?? 0 }
                ))
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
                .frame(maxWidth: 150)
                .multilineTextAlignment(.trailing)
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
    @Binding var duration: Int
    @Binding var repeats: Bool
    @Binding var frequency: Frequency
    
    var body: some View {
        Section("Time Window") {
            Stepper("Duration", value: $duration, in: 1...30)
            Toggle("Recurring", isOn: $repeats)
                
            if repeats {
                
                Picker("Frequency", selection: $frequency) {
                    ForEach(Frequency.allCases, id: \.self) { frequency in
                        Text(frequency.rawValue)
                    }
                }
            }
            }
    }
}

struct MakeNewGoal: View {
    var body: some View {
        VStack{
            Text("New Goal")
                .bold()
                .font(.largeTitle)
            FormView()
            Spacer()
        }
    }
}
//
//#Preview {
//    MakeNewGoal()
//}

