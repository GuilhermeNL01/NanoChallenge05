//
//  OnboardingView.swift
//  NanoChallenge05
//
//  Created by Guilherme Nunes Lobo on 27/02/24.
//

import SwiftUI

private let onboardingSteps = [
OnboardingStep(image: "Image", title: "First Screen", description: "eXPLANATION"),
OnboardingStep(image: "Image", title: "Second Screen", description: "huMAN"),
OnboardingStep(image: "Image", title: "Third Screen", description: "IA")
]
struct OnboardingView: View {
    @State private var showModal = false
    @State private var prompt: String = ""
    @State private var currentStep = 0
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onboardingSteps.count - 1
                    }){
                        Text("Skip")
                            .padding(16)
                            .foregroundColor(.gray)
                    }
                }
                TabView(selection:$currentStep){
                    ForEach(0..<onboardingSteps.count) { it in
                        VStack{
                            Image(onboardingSteps[it].image)
                                .resizable()
                                .frame(width: 350,height: 350)
                            
                            Text(onboardingSteps[it].title)
                                .font(.title)
                                .bold()
                            
                            Text(onboardingSteps[it].description)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .padding(.top)
                            
                            
                        }
                        .tag(it)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                HStack{
                    ForEach(0..<onboardingSteps.count) { it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 20, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.accentColor)
                        } else {
                            Circle()
                                .frame(width: 10,height: 10)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .padding(.bottom, 24)
                NavigationLink(destination: ContentView(), isActive: Binding<Bool>(
                    get: { self.currentStep >= onboardingSteps.count - 1 },
                    set: { _ in }
                )) {
                    Text(currentStep < onboardingSteps.count - 1 ? "Next" : "Get Started")
                        .padding(16)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(16)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                }
                .padding(.bottom, 20)
            }
        }
                .buttonStyle(.plain)
            }
        }

#Preview {
    OnboardingView()
}

