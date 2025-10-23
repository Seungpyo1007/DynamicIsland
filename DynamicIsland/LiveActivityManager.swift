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
    
    // Live Activity의 초기/업데이트 상태 생성
    private static func createContentState(deliveryTime: Date) -> FoodDeliveryAttributes.ContentState {
        return FoodDeliveryAttributes.ContentState(deliveryTime: deliveryTime)
    }
    
    @discardableResult
    static func startActivity(deliveryTime: Date) throws -> String {
        var activity: Activity<FoodDeliveryAttributes>?
        
        let initialState = createContentState(deliveryTime: deliveryTime)
        
        do {
            activity = try Activity.request(
                attributes: FoodDeliveryAttributes(),
                contentState: initialState,
                pushType: nil
            )
            
            guard let id = activity?.id else { throw LiveActivityErrorType.failedToGetID }
            return id
        } catch {
            throw error
        }
    }
    
    // 모든 활성화된 Live Activity 종료
//    static func endAllActivities() async {
//        for activity in Activity<FoodDeliveryAttributes>.activities {
//            await activity.end(dismissalPolicy: .immediate)
//        }
//    }
    
    // 특정 Live Activity 종료
    static func endActivity(_ id: String) async {
        await Activity<FoodDeliveryAttributes>.activities
            .first(where: { $0.id == id })?
            .end(dismissalPolicy: .immediate)
    }
    
    // Live Activity 업데이트
//    static func updateActivity(id: String, deliveryTime: Date) async {
//        let updatedContentState = createContentState(deliveryTime: deliveryTime)
//        
//        let activity = Activity<FoodDeliveryAttributes>.activities
//            .first(where: { $0.id == id })
//        
//        await activity?.update(using: updatedContentState)
//    }
}
