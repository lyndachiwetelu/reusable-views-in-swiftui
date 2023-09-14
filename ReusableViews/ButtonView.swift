
import SwiftUI


enum ButtonTheme {
    case primary
    case secondary
}

struct ButtonView: View {
    var title: String
    var theme: ButtonTheme = .primary
    var action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .foregroundColor(.white)
                .padding()
                .frame(width: 200)
                .background(theme == .primary ? .blue : Color(UIColor.lightGray))
                .cornerRadius(12)
        }
        .padding(.bottom, 20)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "Example", action: {})
    }
}
