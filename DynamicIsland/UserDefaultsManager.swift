////
////  UserDefaultsManager.swift
////  DynamicIsland
////
////  Created by 홍승표 on 10/21/25.
////
//
//import Foundation
//
//struct UserDefaultsManager {
//    
//    static func saveNewActivity(id: String, arrivalTime: String,
//        phoneNumber: String, restaurantName: String,
//        customerAddress: String, deliveryTime: Date) {
//        
//        // deliveryTime을 String으로 변환하여 저장
//        let deliveryTimeString = deliveryTime.ISO8601Format()
//        
//        let activity: [String: String] =
//        [
//            "id": id,
//            "arrivalTime" : arrivalTime,
//            "phoneNumber" : phoneNumber,
//            "restaurantName" : restaurantName,
//            "customerAddress" : customerAddress,
//            "deliveryTime" : deliveryTimeString
//        ]
//        
//        if var activities: [[String: String]] =
//            UserDefaults.standard.object(forKey: "live_activities")
//            as? [[String: String]]
//        {
//            activities.append(activity)
//            UserDefaults.standard.set(activities, forKey:
//                "live_activities")  // activities 배열 전체를 저장
//            
//        } else {
//            UserDefaults.standard.set([activity], forKey:
//                "live_activities")
//        }
//    }
//    
//    static func fetchActivities() ->
//        [FoodDeliveryAttributes.ContentState] {
//        
//        guard let activities: [[String: String]] =
//                UserDefaults.standard.object(forKey: "live_activities")  // 오타 수정: live_activites -> live_activities
//                as? [[String: String]] else {return []}
//            
//            return activities.compactMap {
//                // deliveryTime String을 Date로 변환
//                guard let deliveryTimeString = $0["deliveryTime"],
//                      let deliveryTime = ISO8601DateFormatter().date(from: deliveryTimeString) else {
//                    return nil
//                }
//                
//                return FoodDeliveryAttributes.ContentState(
//                    arrivalTime: $0["arrivalTime"] ?? "",
//                    phoneNumber: $0["phoneNumber"] ?? "",
//                    restaurantName: $0["restaurantName"] ?? "",
//                    customerAddress: $0["customerAddress"] ?? "",
//                    deliveryTime: deliveryTime  // Date 타입으로 전달
//                )
//            }
//    }
//}
