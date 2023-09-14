
import SwiftUI

struct PoloListView: View {
    @Binding var navPaths: [Routes]
    @Binding var selected: [String]
    
    var body: some View {
        BackgroundView(navTitle: "Polo Cart") {
            
            VStack {
                Text("Your Polos")
                    .font(.title2)
                    .padding(.bottom, 10).padding(.top, 50)
                
                ForEach(selected, id:\.self) { s in
                    HStack {
                        Image(s).resizable().frame(width: 100, height: 100)
                        Spacer()
                        Text("$55.99").font(.title3)
                        
                    }.padding(.leading, 50)
                        .padding(.trailing, 50)
                        .padding(.bottom, 10)
                }
                
                Button(action: {
                    
                }) {
                    Text("Continue to Payment")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(.blue)
                        .cornerRadius(12)
                }
                .padding(.bottom, 20).padding(.top, 40)
                
                
                Button(action: {
                    selected.removeAll()
                    navPaths.removeAll()
                }) {
                    Text("Cancel and Restart")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200)
                        .background(Color(UIColor.lightGray))
                        .cornerRadius(12)
                }
                .padding(.bottom, 20)
                
                
                Spacer()
                
            }.padding(50)
            
        }
        
    }
}

struct PoloListView_Previews: PreviewProvider {
    static var previews: some View {
        PoloListView(navPaths: .constant([]), selected: .constant([]))
    }
}
