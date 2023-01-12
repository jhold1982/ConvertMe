//
//  TemperatureView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct TemperatureView: View {
	@State private var userTemp = 0.0
	@State private var tempSelectorIn = "Fahrenheit"
	@State private var tempSelectorOut = "Celsius"
	@FocusState private var userTempIsFocused: Bool
	let tempTypes = ["Fahrenheit", "Celsius", "Kelvin"]
	var fahrenheitToCelsiusOutput: Double {
		Double(userTemp - 32) * 5 / 9
	}
	var fahrenheitToKelvinOutput: Double {
		Double(userTemp - 32) * 5 / 9 + 273.15
	}
	var kelvinToCelsiusOutput: Double {
		Double(userTemp) - 273.15
	}
	var kelvinToFahrenheitOutput: Double {
		Double(userTemp - 273.15) * 9/5 + 32
	}
	var celsiusToKelvinOutput: Double {
		Double(userTemp) + 273.15
	}
	var celsiusToFahrenheitOutput: Double {
		Double(userTemp * 9 / 5) + 32
	}
    var body: some View {
		NavigationStack {
			Form {
				// MARK: INPUT SECTION
				Section("Input:") {
					TextField("Enter Temp", value: $userTemp, format: .number)
						.keyboardType(.decimalPad)
						.focused($userTempIsFocused)
					Picker("Input", selection: $tempSelectorIn) {
						ForEach(tempTypes, id: \.self) {
							Text($0)
						}
					}
					.pickerStyle(.segmented)
				}
				// MARK: OUTPUT SECTION
				Section("Output:") {
					Picker("Output", selection: $tempSelectorOut) {
						ForEach(tempTypes, id: \.self) {
							Text($0)
						}
					}
					.pickerStyle(.segmented)
					Section {
						if tempSelectorIn == "Fahrenheit" && tempSelectorOut == "Celsius" {
							Text(fahrenheitToCelsiusOutput, format: .number)
						} else if tempSelectorIn == "Fahrenheit" && tempSelectorOut == "Kelvin" {
							Text(fahrenheitToKelvinOutput, format: .number)
						} else if tempSelectorIn == "Kelvin" && tempSelectorOut == "Celsius" {
							Text(kelvinToCelsiusOutput, format: .number)
						} else if tempSelectorIn == "Kelvin" && tempSelectorOut == "Fahrenheit" {
							Text(kelvinToFahrenheitOutput, format: .number)
						} else if tempSelectorIn == "Celsius" && tempSelectorOut == "Kelvin" {
							Text(celsiusToKelvinOutput, format: .number)
						} else if tempSelectorIn == "Celsius" && tempSelectorOut == "Fahrenheit" {
							Text(celsiusToFahrenheitOutput, format: .number)
						}
					}
				}
			}
			.navigationTitle("🌡️Temperature❄️")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button("Done") {
					userTempIsFocused = false
					}
				}
			}
		}
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView()
    }
}
