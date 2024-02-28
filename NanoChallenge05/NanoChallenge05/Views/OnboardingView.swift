//
//  OnboardingView.swift
//  NanoChallenge05
//
//  Created by Guilherme Nunes Lobo on 27/02/24.
//

import SwiftUI

private let onboardingSteps = [
    OnboardingStep(image: "first", title: "AI Buster", description: "Hi, I'm Roger! I'm your assistant through the AI Buster application. Today, I'll be showing you how it wokrks..."),
    OnboardingStep(image: "confused", title: "How it Works ?", description: " When you submit your text, a message will be displayed telling you if your text was written by a HUMAN or an AI."),
    OnboardingStep(image: "happy", title: "Human Text", description: "If HUMAN, the text area will become GREEN."),
    OnboardingStep(image: "angry", title: "AI Text", description: "If written by an AI, the text will become RED.")
]
struct OnboardingView: View {
    @State private var prompt: String = ""
    @State private var currentStep = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentStep) {
                    ForEach(0..<onboardingSteps.count) { it in
                        VStack {
                            Image(onboardingSteps[it].image)
                                .resizable()
                                .frame(width: 400, height: 400)
                                
                            Text(onboardingSteps[it].title)
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            
                            Text(onboardingSteps[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top)
                                .foregroundColor(.white)
                        }
                        .tag(it)
                        .opacity(currentStep == it ? 1 : 0)
                        .animation(.easeInOut)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onboardingSteps.count) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.accentColor)
                                .transition(.opacity)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                                .transition(.opacity)
                        }
                    }
                }
                .padding(.bottom, 24)
                
                NavigationLink(destination: ContentView()) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
            }
            .background(Color.backBlack)
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    OnboardingView()
}

