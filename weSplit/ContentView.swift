//
//  ContentView.swift
//  weSplit
//
//  Created by Elliott Harris on 4/4/21.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numOfPeople = "2"
    @State private var tipAmount = 2
    
    let tips = [10, 15, 20, 25, 0]
    var totalPerPerson: (Double, Double) {
        let people = Double(numOfPeople) ?? 0
        let tip = Double(tips[tipAmount])
        let order = Double(checkAmount) ?? 0
        
        let tipVal = order / 100 * tip
        let total = order + tipVal
        let amountPerPerson = total / people
        
        return (amountPerPerson, total)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
//                    Picker("Number of people", selection: $numOfPeople) {
//                        ForEach(2 ..< 100) {
//                            Text("\($0) people")
//                        }
//                    }
                    
                    TextField("Number of people", text: $numOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Tip amount")) {
                    Picker("Tip percentage", selection: $tipAmount) {
                        ForEach(0 ..< tips.count) {
                            Text("\(tips[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalPerPerson.0, specifier: "%.2f")")
                }
                
                Section(header: Text("Total bill")) {
                    Text("$\(totalPerPerson.1, specifier: "%.2f")")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
