import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.white
    
    }
    
    var body: some View {
        TabView {
            DrawerTraining()
                .tabItem {
                
                    Image(systemName: "house")
                        .font(.title)
                    
            }
            TodosList()
                .tabItem {
                    
                Image(systemName: "message")
                    .font(.title)
                
            }
            
            TodosList()
                .tabItem {
                Image(systemName: "plus.circle")
                    .font(.title)
                
            }
            
            TodosList()
                .tabItem {
                Image(systemName: "heart")
                    .font(.title)
                
            }
            TodosList()
                .tabItem {
                Image(systemName: "person")
                    .font(.title)
                
            }
        }.accentColor(.black)
        
        
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}

