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
    
    var body: some View {
        VStack{
            TextEditor(text: $prompt)
                .lineSpacing(5)
                .autocapitalization(.words)
                .disableAutocorrection(false)
                .padding()
            Button("Submit"){
                showModal.toggle()
            }
            .padding()
            .sheet(isPresented: $showModal){
                SheetView()
            }
        }
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
