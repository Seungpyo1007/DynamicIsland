//
//  FoodDeliveryActivityWidgetLiveActivity.swift
//  FoodDeliveryActivityWidget
//
//  Created by 홍승표 on 10/22/25.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct FoodDeliveryActivityWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct FoodDeliveryActivityWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FoodDeliveryActivityWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension FoodDeliveryActivityWidgetAttributes {
    fileprivate static var preview: FoodDeliveryActivityWidgetAttributes {
        FoodDeliveryActivityWidgetAttributes(name: "World")
    }
}

extension FoodDeliveryActivityWidgetAttributes.ContentState {
    fileprivate static var smiley: FoodDeliveryActivityWidgetAttributes.ContentState {
        FoodDeliveryActivityWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: FoodDeliveryActivityWidgetAttributes.ContentState {
         FoodDeliveryActivityWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: FoodDeliveryActivityWidgetAttributes.preview) {
   FoodDeliveryActivityWidgetLiveActivity()
} contentStates: {
    FoodDeliveryActivityWidgetAttributes.ContentState.smiley
    FoodDeliveryActivityWidgetAttributes.ContentState.starEyes
}
