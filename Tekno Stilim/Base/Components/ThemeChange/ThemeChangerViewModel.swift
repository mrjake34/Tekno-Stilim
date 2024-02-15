//
//  ThemeChangerViewModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 14.02.2024.
//

import Foundation
import SwiftUI

final class ThemeChangerViewModel: ObservableObject {
	@Published var scheme: ColorScheme?
	
	func changeTheme(theme: Themes) {
		switch theme {
			case Themes.dark:
				self.scheme = .dark
			case Themes.light:
				self.scheme = .light
			case Themes.systemDefault:
				self.scheme = .none
		}
	}
}


enum Themes {
	case systemDefault
	case dark
	case light
}
