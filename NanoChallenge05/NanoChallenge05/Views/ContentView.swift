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
        VStack{
            TextEditor(text: $prompt)
                .lineSpacing(5)
                .autocapitalization(.words)
                .disableAutocorrection(false)
                .padding()
            Button("Submit"){
                showModal.toggle()
                classify()
            }
            .padding()
            .sheet(isPresented: $showModal){
                SheetView()
            }
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

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Cancel"){
            dismiss()
                
        }
        .font(.title)
        .padding()
        .frame(alignment: .topLeading)
        Spacer()
        
    }
}

#Preview {
    ContentView()
}
