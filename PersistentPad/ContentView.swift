//
//  ContentView.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var text = ""
    @State private var showStartup = true
    
    var body: some View {
        TextEditor(text: $text)
            .padding(8)
            .background(Color(NSColor.textBackgroundColor))
            .cornerRadius(8)
            .padding()
            .sheet(isPresented: $showStartup) {
                StartupView(
                    onOpen: {
                        print("open file tapped")
                        showStartup = false
                    },
                    onNew: {
                        print("new file tapped")
                        text = ""
                        showStartup = false
                    }
                    
                )
            }
    }
}
