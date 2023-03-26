//
//  ContentView.swift
//  PercentChange
//
//  Created by David Heinz on 3/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var lastYearCost = ""
    @State private var currentYearCost = ""
    @State private var percentageChange: Double? = nil
    
    var body: some View {
        VStack {
            Text("Cost Change Calculator")
                .font(.largeTitle)
                .padding()
            
            TextField("Enter last year's cost", text: $lastYearCost)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            
            TextField("Enter current year's cost", text: $currentYearCost)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: calculatePercentageChange) {
                Text("Calculate Percentage Change")
                    .font(.title)
                    .padding()
            }
            
            if let percentageChange = percentageChange {
                Text("Percentage Change: \(String(format: "%.2f", percentageChange))%")
                    .font(.title)
                    .padding()
            } else {
                Text("Percentage Change:")
                    .font(.title)
                    .padding()
            }
        }
        .background(Color.yellow.ignoresSafeArea())
    }
    
    func calculatePercentageChange() {
        guard let lastYearCost = Double(lastYearCost),
              let currentYearCost = Double(currentYearCost),
              lastYearCost != 0 else { return }
        
        percentageChange = ((currentYearCost - lastYearCost) / lastYearCost) * 100
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
