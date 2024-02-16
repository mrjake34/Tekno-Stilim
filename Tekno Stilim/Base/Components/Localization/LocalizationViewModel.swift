//
//  ChangeLangViewModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 16.02.2024.
//

import Foundation

final class LocalizationViewModel: ObservableObject {
	@Published var currentLanguage: Locale?
	@Published var locale: Locale?

	init() {
	}
	
	
	func changeLanguage(locale: Locale?) {
		if locale != nil {
			self.currentLanguage = locale
		}
	}
}
