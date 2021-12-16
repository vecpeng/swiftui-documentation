"use strict";
var _a;
const fs = require('fs');
let documents = [{
        name: "Text",
        content: "",
        view: `Text(text).font(.system(size: fontSize))`,
        paramenters: [{
                name: "text",
                type: "String",
                defaultValue: "\"This is a text, you can change me\""
            }, {
                name: "fontSize",
                type: "CGFloat",
                defaultValue: "12"
            }]
    }, {
        name: "Color",
        content: "",
        view: `Rectangle().fill(color).frame(width: width, height: height)`,
        paramenters: [{
                name: "color",
                type: "Color",
                defaultValue: "Color.blue"
            }, {
                name: "width",
                type: "CGFloat",
                defaultValue: "100",
                maxValue: 100,
            }, {
                name: "height",
                type: "CGFloat",
                defaultValue: "100",
                maxValue: 100,
            }]
    }];
let contentView = `import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
`;
for (let document of documents) {
    const name = document.name[0].toUpperCase() + document.name.substring(1);
    contentView += `
                    NavigationLink(destination: ${name}View()) {
                        Text("${name}")
                    }.navigationBarHidden(true)
    `;
}
contentView += `
                }
                .listStyle(PlainListStyle())
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}
`;
fs.appendFileSync(`../Shared/Views/ContentView.swift`, contentView, (err) => {
    if (err) {
        console.error(err);
        return;
    }
});
for (let document of documents) {
    let string = `
import SwiftUI

struct`;
    const name = document.name[0].toUpperCase() + document.name.substring(1);
    string += " " + name + "View: View" + "{\n";
    // @State 参数
    for (let param of document.paramenters) {
        string += "\t@State var " + param.name + ": " + param.type + " = " + param.defaultValue + "\n";
    }
    string += `
    var body: some View {
        VStack {
            VStack {
                CodeComponent(code: "${document.view}")
                Spacer()
                ${document.view}
            }.frame(minHeight: 400)
            Spacer()
            
            List {
`;
    for (let param of document.paramenters) {
        const typeToComponents = {
            "String": `TextFieldComponent(name: "text", text: $${param.name})`,
            "CGFloat": `SliderComponent(maxValue: ${(_a = param.maxValue) !== null && _a !== void 0 ? _a : 40}, number: $${param.name}, name: "${param.name}")`,
            "Bool": `ToggleComponent(isOpen: $${param.name})`,
            "Color": `ColorPickerComponent(selectedColor: $${param.name})`
        };
        string += `\t\t\t\t${typeToComponents[param.type]}\n`;
    }
    string += "\t\t\t}\n" + "\t\t}\n" + "\t}\n" + "}\n";
    console.log(string);
    fs.appendFileSync(`../Shared/Views/${name}View.swift`, string, (err) => {
        if (err) {
            console.error(err);
            return;
        }
    });
}
