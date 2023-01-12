//
//  HomeView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct SettingsList: Hashable {
	let settingName: String
	let iconName: String
}
struct SettingsInfo: Hashable {
	let infoName: String
	let detailName: String
}
struct HomeView: View {
	
	var settings: [SettingsList] = [
		.init(settingName: "App Info", iconName: "number.circle.fill")
	]
	var info: [SettingsInfo] = [
		.init(infoName: "Current App Version", detailName: "1.0.0")
	]
	
    var body: some View {
		NavigationStack {
			VStack {
				List {
//					Section {
//						ForEach(settings, id: \.self) { setting in
//							NavigationLink(value: setting) {
//								Label(setting.settingName, systemImage: setting.iconName)
//							}
//						}
//					}
				}
				.navigationTitle("⚛️ConvertMe🧮")
			}
		}
	}
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
