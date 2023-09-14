
import SwiftUI

struct BackgroundView<Content: View>: View {
    var navTitle: String
    var content: Content
    
    
    init(navTitle: String, @ViewBuilder content: @escaping () -> Content) {
        self.navTitle = navTitle
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color("AppBg")
            content
            
        }.edgesIgnoringSafeArea(.all)
            .navigationTitle(navTitle).navigationBarTitleDisplayMode(.inline)
       
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(navTitle: "PoloApp") {
            Text("Hello, SwiftUI")
        }
    }
}
