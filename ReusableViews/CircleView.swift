
import SwiftUI

struct CircleView: View {
    @Binding var selectedPoloType: PoloType
    var poloType: PoloType
    var circleColor: Color
    
    var body: some View {
        Circle()
            .fill(circleColor)
            .frame(width: 40, height: 40)
            .overlay(Circle()
                .stroke(.gray, lineWidth: 2).opacity( isSelectedPoloType() ? 1 : 0)
            )
            .onTapGesture {
            selectedPoloType = poloType
        }
    }
    
    private func isSelectedPoloType() -> Bool {
        return selectedPoloType == poloType
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(selectedPoloType: .constant(""), poloType: "polo", circleColor: .red)
    }
}
