//
//  ContentView.swift
//  UnitConverter
//
//  Created by Bryce Hahn on 7/15/20.
//

import SwiftUI

struct ContentView: View {
    @State private var startUnitVal:String = "100"
    @State private var startUnit:Int = 3
    @State private var endUnit:Int = 6
    
    var convertedValue:Double {
        let initialVal = Double(startUnitVal) ?? 0
        let conversion:Double = Double(endUnit - startUnit) //difference between end and start unit indices
        
        if (conversion < 0) {           //values are increasing as unit decreases
            let increase:Double = pow(10, abs(conversion))
            return initialVal * increase
            //return initialVal * Double((abs(conversion) * 1000))
        } else if (conversion > 0) {    //values are decreasing as unit increases
            let increase:Double = pow(10, conversion)
            return initialVal / increase
            //return initialVal / Double((abs(conversion) * 1000))
        } else {
            return initialVal
        }
    }
    
    private var unitAbrev = ["mm", "cm", "dm", "m", "dam", "hm", "km"]
    private var units = ["millimeter", "centimeter", "decimeter", "meter", "decameter", "hectometer", "kilometer"]
    
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter starting unit")) {
                    HStack {
                        TextField("100", text: $startUnitVal)
                            .keyboardType(.decimalPad)
                        Picker("Initial Unit", selection: $startUnit) {
                            ForEach (0 ..< units.count) {
                                Text("... \(unitAbrev[$0]) (\(units[$0]))")
                            }
                        }
                    }
                }
                Section(header: Text("Enter desired unit")) {
                    Picker("Unit Type", selection: $endUnit) {
                        ForEach (0 ..< units.count) {
                            Text("... \(unitAbrev[$0]) (\(units[$0]))")
                        }
                    }
                }
                Section(header: Text("Output")) {
                    Text("\(convertedValue, specifier: "%.3f")\(unitAbrev[endUnit]) - \(units[endUnit])")
                }
            }
            .navigationBarTitle("Unit Converter")
        }
    }
    
    func changeUnit(unit:Int) {
        
    }
}
