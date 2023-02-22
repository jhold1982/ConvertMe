//
//  ContentView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection = 0
	
	var body: some View {
		TabView(selection: $selection) {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house")
				}
				.tag(0)
			TemperatureView()
				.tabItem {
					Label("Temp", systemImage: "thermometer")
				}
				.tag(1)
			DistanceView()
				.tabItem {
					Label("Distance", systemImage: "ruler")
				}
				.tag(2)
			MassView()
				.tabItem {
					Label("Mass", systemImage: "scalemass")
				}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
