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
    
    // Live Activity 시작 시간
    let startTime: Date
    
    // Live Activitiy가 ContentState가 무조건 필요하다고 해서 ㅠ
    struct FoodDeliveryContentState: Codable, Hashable {
    }
}
