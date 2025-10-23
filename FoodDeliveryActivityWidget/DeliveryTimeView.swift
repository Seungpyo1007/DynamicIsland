//
//  DeliveryTimeView.swift
//  FoodDelivery
//

import SwiftUI
import ActivityKit
import WidgetKit
import Combine

struct DeliveryTimeView: View {
    var context: ActivityViewContext<FoodDeliveryAttributes>
    var font: Font = .system(size: 25, weight: .heavy)
    
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(currentTime, style: .time)
            .font(font)
            .foregroundColor(.mint)
            .monospacedDigit()
            .onReceive(timer) { _ in
                currentTime = Date()
            }
    }
}

// MARK: - Compact View용 (작은 폰트)
struct DeliveryTimeCompactView: View {
    var context: ActivityViewContext<FoodDeliveryAttributes>
    
    @State private var currentTime = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Text(currentTime, style: .time)
            .foregroundColor(.mint)
            .monospacedDigit()
            .onReceive(timer) { _ in
                currentTime = Date()
            }
    }
}
