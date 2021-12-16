import SwiftUI

struct ColorView: View{
	@State var color: Color = Color.blue
	@State var width: CGFloat = 100
	@State var height: CGFloat = 100

    var body: some View {
        VStack {
            VStack {
                CodeComponent(code: "Rectangle().fill(color).frame(width: width, height: height)")
                Spacer()
                Rectangle().fill(color).frame(width: width, height: height)
            }.frame(minHeight: 400)
            Spacer()
            
            List {
				ColorPickerComponent(selectedColor: $color)
				SliderComponent(maxValue: 100, number: $width, name: "width")
				SliderComponent(maxValue: 100, number: $height, name: "height")
			}
		}
	}
}
