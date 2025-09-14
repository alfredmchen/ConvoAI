//
//  PermissionManager.swift
//  ConvoAI
//
//  Created by Alfred M Chen on 9/13/25.
//
import Foundation
import AVFoundation

class PermissionManager: ObservableObject {
    @Published var microphonePermissionStatus: AVAudioSession.RecordPermission = .undetermined
    
    init() {
        checkMicrophonePermission()
    }
    
    func checkMicrophonePermission() {
        microphonePermissionStatus = AVAudioSession.sharedInstance().recordPermission
    }
    
    func requestMicrophonePermission() {
        AVAudioSession.sharedInstance().requestRecordPermission { [weak self] granted in
            DispatchQueue.main.async {
                self?.checkMicrophonePermission()
            }
        }
    }
    
    var isMicrophoneAuthorized: Bool {
        return microphonePermissionStatus == .granted
    }
}
