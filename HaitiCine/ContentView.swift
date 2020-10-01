import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HStack( ){

                VStack{
                   Image("user")
                       .resizable()
                       .aspectRatio(contentMode: .fit)
                        .frame(idealWidth: 40, idealHeight: 40)
                        .clipShape(Circle())
                    }.frame(width: 90, height:90)
                    
                       VStack(alignment: .leading){
                           Text("Julio JEAN FILS")
                           .frame(maxWidth: .infinity,
                                  alignment: .leading)
                            .font(.headline)
                        
                           Text("@juliojeanfils")
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .font(.body)
                       }
                    }
            
            
                    Image("store")
                        .resizable()
                        .aspectRatio(contentMode: .fit).cornerRadius(0)
                    .clipShape(Rectangle())
                        .padding(.all)
                    
            
            HStack{
              HStack (){
                  Image("user")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height:  40, alignment: .leading)
                       .clipShape(Circle())
                    
                    Text("Movie name")
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .font(.body)
                
               }
                  
            }
            Spacer()
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
