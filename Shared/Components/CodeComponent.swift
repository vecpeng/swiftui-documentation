//
//  CodeComponent.swift
//  swiftui-documentation
//
//  Created by peng vec on 2021/12/16.
//

import SwiftUI

struct CodeComponent: View {
    var code: String
    var body: some View {
        Text(code)
    }
}

struct CodeComponent_Previews: PreviewProvider {
    static var previews: some View {
        CodeComponent(code: "")
    }
}
