//
//  Tekno_StilimApp.swift
//  Tekno Stilim
//
//  Created by Alkan Ataş on 11.02.2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct Tekno_StilimApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
	@StateObject var localizationViewModel: LocalizationViewModel = LocalizationViewModel()
    var body: some Scene {
        WindowGroup {
            TabBarView()
				.environmentObject(localizationViewModel)
				.environment(\.locale, .init(identifier: localizationViewModel.currentLanguage?.identifier ?? ""))
				
        }
    }
}
