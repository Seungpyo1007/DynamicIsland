//
//  ContentView.swift
//  DynamicIsland
//
//  Created by 홍승표 on 10/21/25.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    // 현재 활성화된 Live Activity의 ID를 저장하는 상태
    @State private var currentActivityID: String?
    
    
    // MARK: - ContentView UI
    var body: some View {
        NavigationView {
            Text("사이트")
                .navigationTitle(Text("홈"))
                .navigationBarItems(trailing:
                Image(systemName: "paperplane.circle.fill").resizable()
                .frame(width: 30, height: 30)
                )
        }
        VStack {
            Button(action: {
                startOrderActivity()
            }, label: {
                Text("Place Order")
                
            })
        }
        .padding()
    }

    // MARK: - LiveActivity 활성화
    public func startOrderActivity() {
        // 기존 Activity가 있다면 먼저 종료합니다.
        if let id = currentActivityID {
            Task {
                await LiveActivityManager.endActivity(id)
            }
            currentActivityID = nil
        }
        
        do {
            // Live ActivityManager를 사용하여 Activity를 시작하고 ID를 저장합니다.
            // 최소한의 정보인 deliveryTime만 전달합니다.
            let id = try LiveActivityManager.startActivity()
            currentActivityID = id
            print("Live Activity Started with ID: \(id)")
        } catch {
            print(error.localizedDescription)
        }
    }
}
//
//#Preview {
//    ContentView()
//}
