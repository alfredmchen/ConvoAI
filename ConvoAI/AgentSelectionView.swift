//
//  AgentSelectionView.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/10/25.
//
import SwiftUI

struct AgentSelectionView: View {
    let agents = Agent.sampleAgents
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack (spacing: 16) {
                    ForEach(agents) { agent in
                        AgentCard(agent: agent)
                    }
                }
                .padding()
            }
            .navigationTitle("Choose an agent:")
        }
    }
}

struct AgentCard: View {
    let agent: Agent
    
    var body: some View {
        NavigationLink(destination: ConversationView()){
            VStack(alignment: .leading, spacing: 8) {
                Text(agent.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text(agent.persona)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.blue)
                
                Text(agent.description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color(.systemBackground))
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
            .cornerRadius(12)
        }
    }
}
