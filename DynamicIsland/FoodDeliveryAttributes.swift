//
//  FoodDeliveryAttributes.swift
//  DynamicIsland
//
//  Created by 홍승표 on 10/21/25.
//

import Foundation
import ActivityKit

struct FoodDeliveryAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var arrivalTime: String
        var phoneNumber: String
        var restaurantName: String
        var customerAddress: String
        var timeName: String
    }
}
