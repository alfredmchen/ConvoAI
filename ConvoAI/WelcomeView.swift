//
//  WelcomeView.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/10/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Welcome to ConvoAI")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Have quick, meaningful conversations with our agents.")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            NavigationLink(destination: AgentSelectionView()) {
                Text("Choose your convo agent")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}
