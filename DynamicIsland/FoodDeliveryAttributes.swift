//
//  FoodDeliveryAttributes.swift
//  DynamicIsland
//
//  Created by 홍승표 on 10/21/25.
//

import ActivityKit
import Foundation

struct FoodDeliveryAttributes: ActivityAttributes {
    
    public typealias ContentState = FoodDeliveryContentState
    
    // Live Activity의 동적 상태 (시계 갱신 기준 시간만 남김)
    struct FoodDeliveryContentState: Codable, Hashable {
        
        // 시계 갱신의 기준이 되는 시간 (Date 타입)
        var deliveryTime: Date
        
        init(deliveryTime: Date = Date()) {
            self.deliveryTime = deliveryTime
        }
    }
}
