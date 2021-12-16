//
//  ColorPickerComponent.swift
//  swiftui-documentation
//
//  Created by peng vec on 2021/12/16.
//

import SwiftUI

struct ColorPickerComponent: View {
    @Binding var selectedColor: Color
    
    var body: some View {
        ColorPicker(selection: $selectedColor, supportsOpacity: false){
          Label("Apple Color", systemImage: "applelogo")
          .foregroundColor(selectedColor)
        }
    }
}

struct ColorPickerComponent_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerComponent(selectedColor: .constant(Color.gray))
    }
}
