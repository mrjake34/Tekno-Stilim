//
//  ThemeChanger.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 14.02.2024.
//

import SwiftUI

struct ThemeChangerView: View {
	@State private var isDark: Bool = false
	@Environment(\.colorScheme) var colorScheme: ColorScheme
	@Environment(\.calendar) var environment: Calendar
	@StateObject var viewModel = ThemeChangerViewModel()
    var body: some View {
		Toggle(LocalizedStringKey("darkMode"),isOn: $isDark).onChange(of: isDark) {
			if colorScheme == .light {
				print(colorScheme)
				print(environment)
				viewModel.changeTheme(theme: Themes.dark)
			}else {
				print(colorScheme)
				viewModel.changeTheme(theme: Themes.light)
			}
		}.preferredColorScheme(viewModel.scheme)
    }
}

#Preview {
	ThemeChangerView()
}

