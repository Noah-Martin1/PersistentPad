//
//  ContentView.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = EditorViewModel()

    var body: some View {
        TextEditor(text: $viewModel.text)
        
            .padding(8) // edge spacing so text doesnt look to hug textbox walls
            .background(Color(NSColor.textBackgroundColor))
            .cornerRadius(8)
        
            .padding()
            .sheet(isPresented: $viewModel.showStartup) {
                StartupView(
                    onOpen: viewModel.openFile,
                    onNew: viewModel.newFile
                )
            }
    }
}
