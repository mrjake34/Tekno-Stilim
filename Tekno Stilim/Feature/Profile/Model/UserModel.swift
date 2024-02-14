//
//  UserModel.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 13.02.2024.
//

import Foundation

struct UserModel: Codable {
	let id: String?
	let fullName: String?
	let email: String?
	
	var initials: String {
		let formatter = PersonNameComponentsFormatter()
		if let component = formatter.personNameComponents(from: fullName ?? "") {
			formatter.style = .abbreviated
			return formatter.string(from: component)
		}
		return ""
	}
}
