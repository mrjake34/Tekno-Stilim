//
//  ChangeLangView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 16.02.2024.
//

import SwiftUI

struct LocalizationView: View {
	@Environment(\.locale) var locale: Locale
	@EnvironmentObject var viewModel: LocalizationViewModel
    var body: some View {
		HStack(spacing: 0) {
			Text(LocalizedStringKey("language"))
			Text(":")
			Spacer()
			Menu(LocalizedStringKey(LocalizationExtension.getCountry(value: locale.identifier))) {
				Button(LocalizedStringKey("turkish")) {
					viewModel.changeLanguage(locale: Locale(identifier: "tr_TR"))
				}
				Button(LocalizedStringKey("english")) {
					viewModel.changeLanguage(locale: Locale(identifier: "en_EN"))
				}
				
			}
		}

    }
}

#Preview {
    LocalizationView()
}
