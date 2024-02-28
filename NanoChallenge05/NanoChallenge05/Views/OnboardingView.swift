//
//  OnboardingView.swift
//  NanoChallenge05
//
//  Created by Guilherme Nunes Lobo on 27/02/24.
//

import SwiftUI

private let onboardingSteps = [
    OnboardingStep(image: "Image", title: "IA Buster", description: "The IA buster is an APP that uses Machine Learning to identify if a text is either made by an AI or a legit person."),
    OnboardingStep(image: "Image", title: "Human Text", description: " When you submit your text a message will be displayed telling the difference."),
    OnboardingStep(image: "Image", title: "IA Text", description: "The IA buster can tell if the author of your text is a IA or a human with amazing precision")
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
                                .frame(width: 350, height: 350)
                            
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

