import WidgetKit
import SwiftUI

struct FoodDeliveryActivityWidget: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FoodDeliveryAttributes.self) { context in
            // MARK: - Live Activity Content (Lock Screen/Home Screen)
            VStack {
                HStack {
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                        .padding(15)
                    
                    Spacer()
                    
                    Text("접수완료")
                        .font(.system(size: 15, weight: .regular))
                        .foregroundColor(.mint)
                        .padding(15)
                }
                Text("\(context.state.arrivalTime)시 \(context.state.timeName)분 도착 예정")
                    .font(.system(size: 25, weight: .heavy))
                    .foregroundColor(.mint)
                Text("\(context.state.restaurantName)")
                    .font(.system(size: 12))
                    .foregroundColor(.mint)
                Spacer()
                ProgressView(value: 0.5, total: 1.0)
                    .progressViewStyle(.linear)
                    .foregroundStyle(.mint)
                    .padding(20)
            }
            
        } dynamicIsland: { context in
            DynamicIsland {
//              DynamicIslandExpandedRegion(.leading) {
//                  HStack {
//                      VStack(alignment: .leading, spacing: 2) {
//                          HStack {
//                              Image("icon")
//                                  .resizable()
//                                  .aspectRatio(contentMode: .fit)
//                                  .frame(width: 30, height: 30)
//                              Text("배달의민족")
//                                  .font(.system(size: 17))
//                          }
//                      }
//                  }
//
//              }
//              DynamicIslandExpandedRegion(.trailing) {
//                  Text("접수완료")
//                      .font(.system(size: 15, weight: .regular))
//                      .foregroundColor(.white)
//              }
                DynamicIslandExpandedRegion(.center) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            HStack {
                                Image("icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 30, height: 30)
                                Text("배달의민족")
                                    .font(.system(size: 17))
                            }
                            
                            Spacer()
                            
                            Text("\(context.state.arrivalTime)시 \(context.state.timeName)분 도착 예정")
                                .font(.system(size: 25, weight: .heavy))
                                .foregroundColor(.white)
                            Text("\(context.state.restaurantName)")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                            
                            Spacer()
                        }
                        
                            Spacer()
                        
                        HStack {
                            VStack {
                                Text("접수완료")
                                    .font(.system(size: 15, weight: .regular))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Image("icon")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 70)
                            }
                        }
                    }
                }
//                DynamicIslandExpandedRegion(.bottom) {
//                    VStack {
//                        Spacer()
//                        ProgressView(value: 0.5, total: 1.0)
//                            .progressViewStyle(.linear)
//                            .foregroundStyle(.mint)
//                        
//                    }
//                }
//                
//----------------------------------------------------------------------------------------------------------------
                
            } compactLeading: {
                HStack(spacing: 4) {
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                .foregroundColor(.white)
            } compactTrailing: {
                Text("\(context.state.timeName)분")
                    .foregroundColor(.mint)
            } minimal: {
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
