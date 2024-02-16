//
//  ChangeLangExtension.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 16.02.2024.
//

import Foundation

final class LocalizationExtension {
	static func getCountry(value: String) -> String {
		switch value {
			case "tr_TR":
				return "turkish"
			default:
				return "english"
		}
	}
}
