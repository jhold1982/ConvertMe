//
//  LiquidView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct LiquidView: View {
	
	@FocusState private var userInputIsFocused: Bool
	
	@State private var inputAmount = 0.0
	@State private var liquidIn = "Gallon"
	@State private var liquidOut = "Liter"
	
	let liquidTypes = ["Gallon", "Quart", "Pint", "Cup", "Oz", "Tbsp", "Tsp", "Liter", "mL", "cL"]
	
	var gallonToQuartOutput: Double {
		let userLiquidG = (inputAmount) * 4
		return userLiquidG
	}
	
	var gallonToPintOutput: Double {
		let userLiquidG = (inputAmount) * 8
		return userLiquidG
	}
	
	var gallonToCupOutput: Double {
		let userLiquidG = (inputAmount) * 15.773
		return userLiquidG
	}
	
	var gallonToOunceOutput: Double {
		let userLiquidG = (inputAmount) * 128
		return userLiquidG
	}
	
	var gallonToTbspOutput: Double {
		let userInputG = (inputAmount) * 256
		return userInputG
	}
	
	var gallonToTspOutput: Double {
		let userInputG = (inputAmount) * 768
		return userInputG
	}
	
	var gallonToLiterOutput: Double {
		let userLiquidG = (inputAmount) * 3.785
		return userLiquidG
	}
	
    var body: some View {
		NavigationStack {
			Form {
				// MARK: INPUT SECTION
				Section("Input:") {
					TextField("Enter Amount", value: $inputAmount, format: .number)
						.keyboardType(.decimalPad)
						.focused($userInputIsFocused)
					Picker("Choose A Unit", selection: $liquidIn) {
						ForEach(liquidTypes, id: \.self) {
							Text($0)
						}
					}
				}
				// MARK: OUTPUT SECTION
				Section("Output:") {
					Picker("Choose A Unit", selection: $liquidOut) {
						ForEach(liquidTypes, id: \.self) {
							Text($0)
						}
					}
					Section {
						if liquidIn == "Gallon" && liquidOut == "Quart" {
							Text(gallonToQuartOutput, format: .number)
						}
						if liquidIn == "Gallon" && liquidOut == "Pint" {
							Text(gallonToPintOutput, format: .number)
						}
						if liquidIn == "Gallon" && liquidOut == "Cup" {
							Text(gallonToCupOutput, format: .number)
						}
						if liquidIn == "Gallon" && liquidOut == "Liter" {
							Text(gallonToLiterOutput, format: .number)
						}
					}
				}
			}
			.navigationTitle("🧪Liquids⚗️")
			.navigationBarTitleDisplayMode(.inline)
			.toolbar {
				ToolbarItemGroup(placement: .keyboard) {
					Spacer()
					Button("Done") {
						userInputIsFocused = false
					}
				}
			}
		}
    }
}

struct LiquidView_Previews: PreviewProvider {
    static var previews: some View {
        LiquidView()
    }
}
