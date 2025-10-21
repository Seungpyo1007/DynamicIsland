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
                    
                    let id = try LiveActivityManager.startActivity(arrivalTime: "15Mins", phoneNumber: "12345678", restaurantName: "McDonald's", customerAddress: "221b Baker Street")
                    
                    UserDefaultsManager.saveNewActivity(id: id, arrivalTime: "15Mins", phoneNumber: "12345678", restaurantName: "McDonald's", customerAddress: "211b Baker Street")
                    
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
