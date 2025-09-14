//
//  ContentView.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/10/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var permissionManager = PermissionManager()
    
    var body: some View {
        NavigationStack {
            WelcomeView()
        }
        VStack(spacing: 20) {
            if permissionManager.isMicrophoneAuthorized {
                VStack(spacing: 15) {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                    
                    Text("Microphone Access Granted!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                }
            } else {
                VStack(spacing: 15) {
                    Image(systemName: "mic.circle")
                        .font(.system(size: 50))
                        .foregroundColor(.blue)
                    
                    Text("Microphone Access Required!")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Button("Grant Microphone Access") {
                        permissionManager.requestMicrophonePermission()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
            }
        }
        .padding()
        .onAppear {
            permissionManager.requestMicrophonePermission()
        }
    }
}
