//
//  ProgressComponent.swift
//  Tests macOS
//
//  Created by peng vec on 2021/12/16.
//
import SwiftUI

struct SliderComponent: View {
    // 滑动最大值
    var maxValue: CGFloat
    @Binding var number: CGFloat
    // 滑块总宽度
    var width: CGFloat = 200

    var name: String
    var body: some View {
        HStack(spacing: 30) {
            Text(name)
            
            Slider(value: $number, in: 0...maxValue, minimumValueLabel: Text("0"), maximumValueLabel: Text("\(Int(maxValue))")) {
                Text("value: \(Int(number))")
            }.frame(width: width)
            .accentColor(.orange)
        }
        
    }
}
