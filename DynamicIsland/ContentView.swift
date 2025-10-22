//
//  ContentView.swift
//  DynamicIsland
//
//  Created by 홍승표 on 10/21/25.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: {
                do {
                    deleteAllActivities()
                    
                    let id = try LiveActivityManager.startActivity(arrivalTime: "15", phoneNumber: "87245202", restaurantName: "맘스터치", customerAddress: "서울 영등포구 여의대방로 9길 5", timeName: "24")
                    
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Place Order")
            
            })
        }
        .padding()
    }
    
    private func deleteAllActivities() {
        for item in UserDefaultsManager.fetchActivities() {
            
            if let activity =
                Activity<FoodDeliveryAttributes>.activities.first(where: {
                $0.contentState.phoneNumber == item.phoneNumber}) {
                    Task {
                        await LiveActivityManager.endActivity(activity.id)
                    }
            }
                
        }
    }
}

#Preview {
    ContentView()
}
