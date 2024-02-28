//
//  ContentViewModel.swift
//  NanoChallenge05
//
//  Created by Enrique Carvalho on 27/02/24.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject{
    @Published var teColor = Color.editorGrey
    @Published var prompt: String = ""
    @Published var promptOut = Text("")
    @Published var isDoneAnalyzing = false
    @Published var promptOutIsEmpty = false
    
    func refresh(){
        prompt = ""
        withAnimation{
            isDoneAnalyzing = false
            teColor = Color.editorGrey
        }
    }
    
    func classify(){
        promptOutIsEmpty = false
        do{
            let model = try AITextClassifier(configuration: .init())
            let prediction = try model.prediction(text: prompt)
            withAnimation{
                teColor = prediction.label == "1" ? Color.editorRed : Color.editorGreen
            }
            if prediction.label == "1"{
                promptOut = Text("This is an ") 
                    .foregroundStyle(.white)
                + Text("AI")
                    .foregroundStyle(.red)
                    .fontWeight(.black)
                + Text("'s text")
                    .foregroundStyle(.white)
            } else {
                promptOut = Text("This is a ")
                    .foregroundStyle(.white)
                + Text("Human")
                    .foregroundStyle(.green)
                    .fontWeight(.black)
                + Text("'s text")
                    .foregroundStyle(.white)
            }
        } catch {
            promptOut = Text("Please insert Prompt")
            withAnimation{
                promptOutIsEmpty = true
            }
        }
        if !prompt.isEmpty{
            withAnimation{
                isDoneAnalyzing = true
            }
        }
    }
}
