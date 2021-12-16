//
//  TextfieldComponent.swift
//  swiftui-documentation
//
//  Created by peng vec on 2021/12/16.
//

import SwiftUI

struct TextFieldComponent: View {
    var name: String
    @Binding var text: String
    var body: some View {
        HStack {
            Text("text: ")
            TextField(name, text: $text)
                .foregroundColor(.white)
                .frame(width: 300, height: 48, alignment: .center)
                .padding(.horizontal, 16)
                .background(.black)
                .cornerRadius(10)
        }
    }
}

struct TextFieldComponent_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldComponent(name: "", text: .constant(""))
    }
}
