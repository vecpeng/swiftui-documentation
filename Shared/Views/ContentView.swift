import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {

                    NavigationLink(destination: TextView()) {
                        Text("Text")
                    }.navigationBarHidden(true)
    
                    NavigationLink(destination: ColorView()) {
                        Text("Color")
                    }.navigationBarHidden(true)
    
                }
                .listStyle(PlainListStyle())
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
    }
}
