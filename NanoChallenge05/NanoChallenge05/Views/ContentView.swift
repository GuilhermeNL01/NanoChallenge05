//
//  ContentView.swift
//  CoreMLTestApplication
//
//  Created by João Ângelo on 20/02/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var contentViewModel = ContentViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Text("APP NAME HERE")
                    .font(.system(size: 20, weight: .black))
                    .foregroundStyle(.white)
                if contentViewModel.isDoneAnalyzing || contentViewModel.promptOutIsEmpty{
                    withAnimation(.easeInOut){
                        contentViewModel.promptOut
                            .foregroundStyle(.white)
                    }
                }
                ZStack(alignment: .topLeading){
                    TextEditor(text: $contentViewModel.prompt)
                        .lineSpacing(5)
                        .autocapitalization(.words)
                        .disableAutocorrection(false)
                        .foregroundStyle(.white)
                        .disabled(contentViewModel.isDoneAnalyzing)
                        .padding(12)
                        .background{
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(contentViewModel.teColor)
                        }
                        .padding(20)
                        .textEditorStyle(.plain)
                        .frame(width: geometry.size.width, height: 307)
                    if contentViewModel.prompt.isEmpty{
                        Text("Insert your prompt here!")
                            .foregroundStyle(.gray)
                            .padding(.top, 42)
                            .padding(.leading, 36)
                    }
                }
                if contentViewModel.isDoneAnalyzing{
                    Button{
                        contentViewModel.refresh()
                    } label: {
                        HStack {
                            Text("Refresh")
                        Image(systemName: "arrow.clockwise")
                        }
                    }
                    .buttonStyle(GrowingButton())
                    .padding()
                    Spacer()
                } else {
                    Button("Analyze"){
                        contentViewModel.classify()
                    }
                    .buttonStyle(GrowingButton())
                    .padding()
                    Spacer()
                }
            }.frame(width: geometry.size.width, height: geometry.size.height)
            .background(Color.backBlack)
        .navigationBarBackButtonHidden()
        }
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.blueGreen)
            .foregroundStyle(Color.backBlack)
            .font(.custom("SF-Pro-Display",size: 16))
            .fontWeight(.semibold)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
