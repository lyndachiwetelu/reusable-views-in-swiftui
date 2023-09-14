
import SwiftUI

enum Routes {
    case maker
    case list
}

struct NavigationStackView: View {
    @State private var navPaths = [Routes]()
    @State private var selections = [String]()
    
    var body: some View {
        NavigationStack(path: $navPaths) {
            PoloMakerView(navPaths: $navPaths, selected: $selections).navigationDestination(for: Routes.self) { r in
                switch r {
                case .maker:
                    PoloMakerView(navPaths: $navPaths, selected: $selections)
                case .list:
                    PoloListView(navPaths: $navPaths,  selected: $selections)
                }
            }
        }
    }
}

struct NavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStackView()
    }
}
