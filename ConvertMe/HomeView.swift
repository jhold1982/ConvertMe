//
//  HomeView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		NavigationStack {
			ZStack {
				VStack {
					Text("Select a Tab below")
					Text("and convert something!")
				}
			}
			.font(.headline)
			.navigationTitle("⚛️ConvertMe🧮")
		}
		.padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
