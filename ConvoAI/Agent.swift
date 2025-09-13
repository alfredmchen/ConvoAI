//
//  Agent.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/10/25.
//

import Foundation

struct Agent: Identifiable {
    let id = UUID()
    let name: String
    let persona: String
    let description: String
}

extension Agent {
    static let sampleAgents = [
        Agent(name: "Maya",
              persona: "Empathetic counselor",
              description: "Maya is a compassionate therapist who helps people navigate through difficult emotions."),
        Agent(name: "Benny",
              persona: "Jovial and friendly barista",
              description: "Benny is a friendly barista who loves to chat and make people smile."),
        Agent(name: "Jordan",
              persona: "Motivating and inspiring coach",
              description: "Jordan is a coach who helps people achieve their goals and dreams.")
    ]
}
