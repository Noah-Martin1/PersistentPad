//
//  StartupView.swift
//  PersistentPad
//
//  Created by Noah Martin on 2/6/2026.
//

import SwiftUI

struct StartupView: View {
    let onOpen: () -> Void
    let onNew: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("PersistentPad")
                .font(.title)
            
            Text("Choose an option")
            
            Button("Open Existing File") {
                onOpen()
            }
            
            Button("Create New File") {
                onNew()
            }
        }
        .padding(30)
        .frame(width: 300)
    }

}

