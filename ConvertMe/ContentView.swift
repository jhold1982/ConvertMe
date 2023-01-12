//
//  ContentView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct ContentView: View {
	
    var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag(0)
			TemperatureView()
				.tabItem {
					Label("Temperatures", systemImage: "medical.thermometer.fill")
				}
				.tag(1)
			LiquidView()
				.tabItem {
					Label("Liquids", systemImage: "drop.circle.fill")
				}
				.tag(2)
			WeightsView()
				.tabItem {
					Label("Weights", systemImage: "scalemass.fill")
				}
			DistanceView()
				.tabItem {
					Label("Distances", systemImage: "arrow.left.and.right")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
