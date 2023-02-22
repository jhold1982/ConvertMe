//
//  DistanceView.swift
//  ConvertMe
//
//  Created by Justin Hold on 2/22/23.
//

import SwiftUI

struct DistanceView: View {
	@State private var input = 0.0
	@State private var selectedUnits = 0
	@State private var inputUnit: Dimension = UnitTemperature.fahrenheit
	@State private var outputUnit: Dimension = UnitTemperature.celsius
	
	
	@FocusState private var inputIsFocused: Bool
	
	let formatter: MeasurementFormatter
	
	let conversions = ["Distance", "Mass", "Temperature", "Time"]
	
	let unitTypes = [
		[UnitLength.feet, UnitLength.kilometers, UnitLength.meters,
		 UnitLength.miles, UnitLength.yards],
		
		[UnitMass.grams, UnitMass.kilograms, UnitMass.ounces,
		 UnitMass.pounds],
		
		[UnitTemperature.celsius, UnitTemperature.fahrenheit,
		 UnitTemperature.kelvin],
		
		[UnitDuration.hours, UnitDuration.minutes, UnitDuration.seconds]
	]
	
	var result: String {
		let inputMeasurement = Measurement(value: input, unit: inputUnit)
		let outputMeasurement = inputMeasurement.converted(to: outputUnit)
		return formatter.string(from: outputMeasurement)
	}
    var body: some View {
		NavigationStack {
			Form {
				
				Section("Amount to convert") {
					TextField("Amount", value: $input, format: .number)
						.keyboardType(.decimalPad)
						.focused($inputIsFocused)
				}
				
				Picker("Conversion", selection: $selectedUnits) {
					ForEach(0..<conversions.count, id: \.self) {
						Text(conversions[$0])
					}
				}
				.pickerStyle(.menu)
				
				Picker("Convert from:", selection: $inputUnit) {
					ForEach(unitTypes[selectedUnits], id: \.self) {
						Text(formatter.string(from: $0).capitalized)
					}
				}
				.pickerStyle(.menu)
				
				Picker("Convert to:", selection: $outputUnit) {
					ForEach(unitTypes[selectedUnits], id: \.self) {
						Text(formatter.string(from: $0).capitalized)
					}
				}
				.pickerStyle(.menu)
				
				Section("Result") {
					Text(result)
				}
				
			}
			.navigationTitle("Distance")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItem {
					Button("Reset All") {
						reset()
					}
					.padding()
				}
			}
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button("Done") {
					inputIsFocused = false
					}
				}
			}
			.onChange(of: selectedUnits) { newSelection in
				let units = unitTypes[newSelection]
				inputUnit = units[0]
				outputUnit = units[1]
			}
		}
    }
	
	init() {
		formatter = MeasurementFormatter()
		formatter.unitOptions = .providedUnit
		formatter.unitStyle = .short
	}
	
	func reset() {
		input = 0.0
		selectedUnits = 0
	}
}

struct DistanceView_Previews: PreviewProvider {
    static var previews: some View {
        DistanceView()
    }
}
