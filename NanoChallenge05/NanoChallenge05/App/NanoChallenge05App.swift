//
//  NanoChallenge05App.swift
//  NanoChallenge05
//
//  Created by Guilherme Nunes Lobo on 22/02/24.
//

import SwiftUI

@main
struct NanoChallenge05App: App {
    @AppStorage("isOnboarding") var isOnboarding = true
    
    var body: some Scene {
        WindowGroup {
            if isOnboarding{
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}
