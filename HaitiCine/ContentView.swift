import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Movies list").font(.largeTitle)
                .foregroundColor(Color.blue)
            Spacer()
            Image("store")
                .resizable()
                .aspectRatio(contentMode: .fit).cornerRadius(20)
            .clipShape(Circle())
                .padding(.all)
            Spacer()
            VStack{

            Text(" Movie name")
            .font(.title)
            Text("Movie description")
                .font(.body)
            }
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
