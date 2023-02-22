//
//  HomeView.swift
//  ConvertMe
//
//  Created by Justin Hold on 2/22/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
		NavigationStack {
			ZStack {
				Text("Home")
			}
			.navigationTitle("ConvertMe")
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
