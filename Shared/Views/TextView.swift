import SwiftUI

struct TextView: View{
	@State var text: String = "This is a text, you can change me"
	@State var fontSize: CGFloat = 12

    var body: some View {
        VStack {
            VStack {
                CodeComponent(code: "Text(text).font(.system(size: fontSize))")
                Spacer()
                Text(text).font(.system(size: fontSize))
            }.frame(minHeight: 400)
            Spacer()
            
            List {
				TextFieldComponent(name: "text", text: $text)
				SliderComponent(maxValue: 40, number: $fontSize, name: "fontSize")
			}
		}
	}
}
