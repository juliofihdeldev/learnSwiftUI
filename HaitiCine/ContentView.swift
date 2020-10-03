import SwiftUI

struct ContentView: View {
    var body: some View {
        TodosList()
    }
}

    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
         .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}

