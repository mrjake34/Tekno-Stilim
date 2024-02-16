//
//  ChangeLangView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 16.02.2024.
//

import SwiftUI

struct ChangeLangView: View {
	@Environment(\.locale) var locale: Locale
	@EnvironmentObject var viewModel: ChangeLangViewModel
    var body: some View {
		HStack(spacing: 0) {
			Text(LocalizedStringKey("language"))
			Text(":")
			Spacer()
			Menu(LocalizedStringKey(ChangeLangExtension.getCountry(value: locale.identifier))) {
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
    ChangeLangView()
}
