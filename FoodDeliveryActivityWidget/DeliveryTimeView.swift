//
//  DeliveryTimeView.swift
//  FoodDelivery
//

import SwiftUI
import ActivityKit
import WidgetKit

// MARK: - (큰 폰트)
struct DeliveryTimeView: View {
    var context: ActivityViewContext<FoodDeliveryAttributes>
    var font: Font = .system(size: 25, weight: .heavy)
    
    private var endTime: Date {
        context.attributes.startTime.addingTimeInterval(15 * 60)
    }
    
    var body: some View {
        Text(endTime, style: .time)
            .font(font)
            .foregroundColor(.mint)
            .monospacedDigit()
    }
}

// MARK: - (작은 폰트) Compact View 전용
struct DeliveryTimeCompactView: View {
    var context: ActivityViewContext<FoodDeliveryAttributes>
    
    private var endTime: Date {
        context.attributes.startTime.addingTimeInterval(15 * 60)
    }
    
    var body: some View {
        Text(endTime, style: .time)
            .foregroundColor(.mint)
            .monospacedDigit()
    }
}
