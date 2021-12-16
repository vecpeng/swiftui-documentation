//
//  ToggleComponent.swift
//  swiftui-documentation
//
//  Created by peng vec on 2021/12/16.
//

import SwiftUI

struct ToggleComponent: View {
    @Binding var isOpen: Bool
    var text: String
    var body: some View {
        Toggle(isOn: $isOpen.animation(.spring())) {
            Text(text)
        }.toggleStyle(SwitchToggleStyle(tint: .blue))
    }
}

struct ToggleComponent_Previews: PreviewProvider {
    static var previews: some View {
        ToggleComponent(isOpen: .constant(false), text: "")
    }
}
