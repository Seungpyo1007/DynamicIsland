import WidgetKit
import SwiftUI

struct FoodDeliveryActivityWidget: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FoodDeliveryAttributes.self) { context in
            
            // MARK: - Live Activity Content (홈 화면)
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
                HStack(spacing: 4) {
                    DeliveryTimeView(context: context)
                    Text("도착 예정")
                        .font(.system(size: 25, weight: .heavy))
                        .foregroundColor(.mint)
                }
                
                Text("맘스터치")
                    .font(.system(size: 12))
                    .foregroundColor(.mint)
                
                Spacer()
                
                ProgressView(
                    timerInterval: context.attributes.startTime...context.attributes.startTime.addingTimeInterval(15 * 60),
                    countsDown: false,
                    label: { EmptyView() },
                    currentValueLabel: { EmptyView() }
                )
                .progressViewStyle(.linear)
                .tint(.mint)
                .padding(15)
            }
            
        // MARK: - Dynamic Island (메인 화면)
        } dynamicIsland: { context in
            DynamicIsland {
                // 왼쪽 위 끝
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
//              // 오른쪽 위 끝
//              DynamicIslandExpandedRegion(.trailing) {
//                  Text("접수완료")
//                      .font(.system(size: 15, weight: .regular))
//                      .foregroundColor(.white)
//              }
                
                // 중간
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
                            
                            HStack(spacing: 4) {
                                DeliveryTimeView(context: context, font: .system(size: 25, weight: .heavy))
                                    .foregroundColor(.white)
                                Text("도착 예정")
                                    .font(.system(size: 25, weight: .heavy))
                                    .foregroundColor(.white)
                            }
                            
                            Text("맘스터치")
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
                
                // 밑 바닥
                DynamicIslandExpandedRegion(.bottom) {
                    ProgressView(
                        timerInterval: context.attributes.startTime...context.attributes.startTime.addingTimeInterval(15 * 60),
                        countsDown: false,
                        label: { EmptyView() },
                        currentValueLabel: { EmptyView() }
                    )
                    .padding(5)
                    .progressViewStyle(.linear)
                    .tint(.mint)
                    .frame(width: 328, height: 10)
                }
            
            // MARK: - Compact View 작은 화면
            // 왼쪽 끝
            } compactLeading: {
                HStack(spacing: 4) {
                    Image("icon")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
                .foregroundColor(.white)
                
            // 오른쪽 끝
            } compactTrailing: {
                DeliveryTimeCompactView(context: context)
            } minimal: {
                Image("icon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
            }
        }
    }
}
