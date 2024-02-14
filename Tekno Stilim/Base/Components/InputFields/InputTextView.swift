//
//  InputTextView.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 12.02.2024.
//

import SwiftUI

struct InputTextView: View {
	var title: String
	var label: String
	var text: Binding<String>
	
    var body: some View {
		VStack(alignment: .leading ,content: {
			Text(title)
				.font(.title3)
			TextField(text: text) {
				Text(label)
			}
			Divider()
		})
    }
}
