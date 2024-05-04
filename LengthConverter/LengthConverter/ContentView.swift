//
//  ContentView.swift
//  LengthConverter
//
//  Created by Олег Зиновьев on 04.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var inputLength = 0.0
    @State private var inputUnitType = ""
    @State private var outputUnitType = ""
    
    @FocusState private var amountIsFocused: Bool
    
    let unitInputTypes = ["m", "km", "ft", "ml"]
    let unitOutputTypes = ["m", "km", "ft", "ml"]
    
    var theResult: Double {
    
            let inputTypeSelection = inputUnitType
            let outputTypeSelection = outputUnitType
            
            
            let metersToFeet = inputLength * 3.281
            let metersToKilometers = inputLength / 1000
            let metersToMiles = inputLength / 1609
    
            let kilometersToMeters = inputLength * 1000
            let kilometersToFeets = inputLength * 3281
            let kilometersToMiles = inputLength / 1.609
    
            let feetToMeters = inputLength / 3.281
            let feetToKilometers = inputLength / 3281
            let feetToMiles = inputLength / 5280
            
            let milesToMeters = inputLength * 1609
            let milesToKilometers = inputLength * 1.609
            let milesToFeet = inputLength * 5280
            
            if inputTypeSelection == outputTypeSelection {
                return inputLength
            }
            
            else if inputTypeSelection == "m" && outputTypeSelection == "km" {
                return metersToKilometers
            } else if inputTypeSelection == "m" && outputTypeSelection == "ft" {
                return metersToFeet
            } else if inputTypeSelection == "m" && outputTypeSelection == "ml" {
                return metersToMiles
            }
            
            else if inputTypeSelection == "km" && outputTypeSelection == "m" {
                return kilometersToMeters
            } else if inputTypeSelection == "km" && outputTypeSelection == "ft" {
                return kilometersToFeets
            } else if inputTypeSelection == "km" && outputTypeSelection == "ml" {
                return kilometersToMiles
            }
            
            else if inputTypeSelection == "ft" && outputTypeSelection == "m" {
                return feetToMeters
            } else if inputTypeSelection == "ft" && outputTypeSelection == "km" {
                return feetToKilometers
            } else if inputTypeSelection == "ft" && outputTypeSelection == "ml" {
                return feetToMiles
            }
            
            else if inputTypeSelection == "ml" && outputTypeSelection == "m" {
                return milesToMeters
            } else if inputTypeSelection == "ml" && outputTypeSelection == "km" {
                return milesToKilometers
            } else if inputTypeSelection == "ml" && outputTypeSelection == "ft" {
                return milesToFeet
            }
    
            return 0
        }
    
    
    var body: some View {
        NavigationView {
            Form {
                                
                // Selecting an input unit of lenth
                Section {
                    Picker("Input unit of length", selection: $inputUnitType) {
                        ForEach(unitInputTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input unit of length")
                }
                
                // Selecting an input value
                Section {
                    TextField("Input value", value: $inputLength, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Inpur value")
                }
                
                // Selecting an output unit of lenth
                Section {
                    Picker("Output unit of length", selection: $outputUnitType) {
                        ForEach(unitOutputTypes, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output unit of length")
                }
            
                
                // The result of conversion
                Section {
                    Text(theResult.formatted())
                } header: {
                    Text("Conversion result")
                }
                
            }
                .navigationBarTitle("Length Converter")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }

            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

