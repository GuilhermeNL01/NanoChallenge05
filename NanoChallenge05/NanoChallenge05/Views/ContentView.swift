//
//  ContentView.swift
//  CoreMLTestApplication
//
//  Created by João Ângelo on 20/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    @State private var prompt: String = ""
    @State private var promptOut: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack {
                    if prompt.isEmpty{
                        Text("Insert your prompt here...")
                            
                    }
                    TextEditor(text: $prompt)
                        .textEditorStyle(.plain)
                        .background(Color.editorGrey)
                        .cornerRadius(20)
                        .multilineTextAlignment(.leading)
                        .lineSpacing(5)
                        .autocapitalization(.words)
                        .disableAutocorrection(false)
                        .frame(width: 356, height: 314)
                        .offset(CGSize(width: 0, height: -20))
                }
                Button("Analyze"){
                    classify()
                }
                .buttonStyle(GrowingButton())
                .padding()
                .frame(width: 140, height: 34)
            }.frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.backBlack)
        .navigationBarBackButtonHidden()
        }
    }
    func classify(){
        do{
            let model = try AITextClassifier(configuration: .init())
            let prediction = try model.prediction(text: prompt)
            prompt = prediction.label
        } catch {
            promptOut = "Something is wrong"
        }
        showModal = true
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blueGreen)
            .foregroundStyle(Color.backBlack)
            .font(.custom("SF-Pro-Display", size: 16))
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
