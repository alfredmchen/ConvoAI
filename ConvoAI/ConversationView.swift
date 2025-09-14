//
//  ConversationView.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/13/25.
//
import SwiftUI

struct ConversationView: View {
    @State private var isRecording = false
    @State private var timeRemaining = 60
    @State private var timer: Timer?
    var body: some View {
        VStack {
            Text("Let't talk!")
                .font(.title)
                .padding()
            Text(formatTime(timeRemaining))
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(isRecording ? .red : .primary)
                .padding()
            Button(action: {
                if isRecording {
                    stopRecording()
                } else {
                    startRecording()
                }
            }) {
                Image(systemName: isRecording ? "stop.fill" : "mic.fill")
                    .font(.system(size:40))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
                    .background(isRecording ? Color.red : Color.blue)
                    .clipShape(Circle())
                    .scaleEffect(isRecording ? 1.1 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isRecording)
            }
            .padding()
        }
    }
    
    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secondsPart = seconds % 60
        return String(format: "%02d:%02d", minutes, secondsPart)
    }
    
    private func startRecording() {
        isRecording = true
        timeRemaining = 60
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                stopRecording()
            }
        }
    }
    
    private func stopRecording() {
        isRecording = false
        timer?.invalidate()
        timer = nil
        timeRemaining = 60
    }
}

#Preview {
    ConversationView()
}
