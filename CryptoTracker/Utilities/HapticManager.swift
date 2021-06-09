//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Тагир Аюпов on 2021-06-09.
//

import Foundation
import SwiftUI

class HapticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
