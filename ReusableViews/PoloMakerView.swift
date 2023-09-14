
import SwiftUI

typealias PoloType = String

struct PoloMakerView: View {
    @Binding var navPaths: [Routes]
    @State var selectedPoloType: PoloType = "polo"
    @Binding var selected: [String]
    var poloTypes: [PoloType] = [
        "polo",
        "red-polo",
        "blue-polo",
        "green-polo",
    ]
    
    var poloTypeToColorMap: [PoloType: Color] = [
        "polo": .white,
        "red-polo": .red,
        "blue-polo": .blue,
        "green-polo": .green
        
    ]
    
    var body: some View {
        BackgroundView(navTitle: "Polo Maker") {
            VStack {
                
                Text("Choose Your Style").font(.title2).padding(.bottom, 40)
                
                Image(selectedPoloType).resizable().frame(width: 200, height: 200).padding(.bottom, 30)
                
                HStack {
                    ForEach(poloTypes, id: \.self) { pT in
                        CircleView(selectedPoloType: $selectedPoloType, poloType: pT, circleColor: poloTypeToColorMap[pT]!)
                    }
                    
                }.padding(.bottom, 30)
                
                
                VStack {
                    ButtonView(title: "Choose Polo") {
                        if !selected.contains(selectedPoloType) {
                            selected.append(selectedPoloType)
                        }
                       
                        navPaths.append(.list)
                    }
                    
                    ButtonView(title: "Cancel", theme: .secondary) {
                        selected.removeLast()
                        selectedPoloType = "polo"
                    }
                    
                }
            }
            
        }
       
    }
    
    private func isSelectedImage(_ imageName: String) -> Bool {
        return imageName == selectedPoloType
    }
}

struct PoloMakerView_Previews: PreviewProvider {
    static var previews: some View {
        PoloMakerView(navPaths: .constant([]), selected: .constant([]))
    }
}
