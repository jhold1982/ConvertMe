//
//  SettingsView.swift
//  ConvertMe
//
//  Created by Justin Hold on 12/31/22.
//

import SwiftUI

struct SettingsMenu: Hashable {
	let settingName: String
	let imageName: String
	let imageColor: Color
}
struct SettingsInfo: Hashable {
	let name: String
	let detail: String
}

struct SettingsView: View {
	var settings: [SettingsMenu] = [
		.init(settingName: "App Version", imageName: "number.circle.fill", imageColor: .green),
		.init(settingName: "Contact Info", imageName: "square.and.pencil.circle.fill", imageColor: .orange)
	]
	var info: [SettingsInfo] = [
		.init(name: "Empty Name", detail: "Empty Detail")
	]
    var body: some View {
		NavigationStack {
			List {
				Section {
					ForEach(settings, id: \.self) { setting in
						NavigationLink(value: setting) {
							Label(setting.settingName, systemImage: setting.imageName)
								.foregroundColor(setting.imageColor)
						}
					}
				}
			}
			.navigationTitle("Settings")
			.navigationDestination(for: SettingsMenu.self) { setting in
				ZStack {
					setting.imageColor.ignoresSafeArea()
					Label(setting.settingName, systemImage: setting.imageName)
						.font(.largeTitle).bold()
				}
			}
		}
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
