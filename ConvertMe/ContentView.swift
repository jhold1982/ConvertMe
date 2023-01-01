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
			TemperatureView()
				.tabItem {
					Label("Temperatures", systemImage: "medical.thermometer.fill")
				}
			LiquidView()
				.tabItem {
					Label("Liquids", systemImage: "mug.fill")
				}
			DistanceView()
				.tabItem {
					Label("Distances", systemImage: "lines.measurement.horizontal")
				}
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
