//
// LiveActivityManager.swift
// DynamicIsland
//
// Created by 홍승표 on 10/21/25.
//

import Foundation
import ActivityKit

// MARK: - Live Activity Manager Error
enum LiveActivityErrorType: Error {
    case failedToGetID
}

// MARK: - LiveActivityManager
final class LiveActivityManager {
    
    @discardableResult
    static func startActivity() throws -> String {
        var activity: Activity<FoodDeliveryAttributes>?
        
        do {
            activity = try Activity.request(
                attributes: FoodDeliveryAttributes(startTime: Date()),
                contentState: FoodDeliveryAttributes.ContentState(),
                pushType: nil
            )
            
            guard let id = activity?.id else { throw LiveActivityErrorType.failedToGetID }
            return id
        } catch {
            throw error
        }
    }
    
    // 특정 Live Activity 종료
    static func endActivity(_ id: String) async {
        await Activity<FoodDeliveryAttributes>.activities
            .first(where: { $0.id == id })?
            .end(dismissalPolicy: .immediate)
    }
}
