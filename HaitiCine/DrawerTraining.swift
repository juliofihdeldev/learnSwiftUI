import SwiftUI

struct DrawerTraining: View {
    @State var index = "Home"
    @State var show = false
    @State var titleHeader = "Drawer learning"
    
    var body: some View {
        ZStack{
            ( self.show ? Color.black.opacity(0.05) : Color.clear).edgesIgnoringSafeArea(.all)
            
            ZStack(alignment:.leading){
                
                VStack(alignment: .leading, spacing:25){
                    
                    HStack{
                        
                        Image("jul")
                            .resizable()
                            .frame(width: 65, height:65)
                            .cornerRadius(65)
                        
                        VStack(alignment:.leading, spacing: 8){
                            Text("Julio JEAN FILS")
                                .fontWeight(.bold)
                            Text("Port au prince, Haiti")
                            
                        }
                    }.padding(.bottom,50)
                    
                    ForEach(MenuList, id: \.self){i in                        Button(action: {
                        self.index = i
                        self.titleHeader = i
                        print(self.titleHeader )
                        
                        withAnimation(.spring()){
                            self.show.toggle()
                            self.titleHeader = i
                        }
                        
                    } ){
                        HStack{
                            Capsule()
                                .fill(self.index == i ? Color.orange: Color.clear)
                                .frame(width:5,height:30)
                            Text(i).padding(.leading)
                                .foregroundColor(Color.black)
                        }
                        }
                    }
                    
                    
                    Spacer()
                }.padding(.leading)
                    .padding(.top)
                    .scaleEffect(self.show ? 1 : 0 )
                
                ZStack(alignment: .topTrailing){
                    
                    MainView(show: self.$show,index: self.$index, titleHeader: self.$titleHeader    )
                        .scaleEffect(self.show ? 0.8: 1)
                        .offset(x:self.show ? 150 : 0,
                                y: self.show ? 50:0)
                        .disabled(self.show ? true : false)
                    
                    
                    Button(action: {
                        withAnimation (.spring()){
                            self.show.toggle()
                        }
                    }){
                        Image(systemName:"xmark")
                            .resizable()
                            .frame(width: 18, height:18)
                            .foregroundColor(Color.black)
                    }.padding()
                        .opacity(self.show ? 1:0)
                    
    
                }
                
            }
            
        }
        
    }
}

struct MainView : View {
    @Binding var show : Bool
    @Binding var index  : String
    @Binding var titleHeader : String
    
    var body : some View{
        VStack(spacing:0){
            ZStack{
                HStack{
                    
                    Button(action: {
                        
                        withAnimation(.spring()){
                            self.show.toggle()
                        }
                        
                    }){
                        Image("menu")
                            .resizable()
                            .frame(width:24, height: 24)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    
                    Button(action: {
                      
                    }){
                        Image("dot")
                            .resizable()
                            .frame(width:24, height: 24)
                            .foregroundColor(.black)
                    }
                }
                
                Text(self.titleHeader)
                    .fontWeight(.bold)
                    .font(.title)
            }
            .padding(.horizontal)
            .padding(.vertical, 10 )
            
            ZStack{
                Home().opacity(self.index == "Home" ? 1 :0 )
                Settings().opacity(self.index == "Settings" ? 1 :0 )
                Profile().opacity(self.index == "Profile" ? 1 :0 )
                Help().opacity(self.index == "Help" ? 1 :0 )
                
            }
            
        }.background(Color.white)
        .cornerRadius(15)
    }
}


struct Home : View{
    var body : some View {
    
               TodosList()
    // ScrollView(.vertical, showsIndicators: false){
    //
    //            VStack(spacing:18){
    //                ForEach(Data, id: \.self){i in
    //                    Image(i)
    //
    //                        .resizable()
    //
    //                        .aspectRatio(contentMode: .fit)
    //                        .cornerRadius(20)
    //
    //                }
    //            }.padding(.top, 8)
    //                .padding(.horizontal)
    //        }
    }
}


struct Settings : View {
    
    @State var settingsData = [
        SettingsData(name:"Your story",
                imageUrl:"jul"),
        SettingsData(name:"Iphone",
                 imageUrl:"iphone"),
        SettingsData(name:"Ipad",
                 imageUrl:"ipad"),
        SettingsData(name:"Apple Watch",
                 imageUrl:"watch"),
    ]

    
    var body : some View{
        GeometryReader{_ in
            VStack (alignment :.leading){
                List(){
                    ForEach(self.settingsData){item in
                        HStack{
                            Image(item.imageUrl).resizable()
                                .frame(width:20, height:20)
                                .aspectRatio(contentMode:.fit)
                                .cornerRadius(20)
                            Text(item.name).font(.body )
                            
                        }
                        .padding(12)
                    }
                    .background(Color.white)
                }
            }
            Spacer()
        }
    }
}


struct Profile : View {
    var body : some View{
        GeometryReader{_ in
           UsersSwiftUIView()
        }
    }
    
}


struct Help : View {
    var body : some View{
        GeometryReader{_ in
            VStack{
               Text("Help")
            }
        }
    }
    
}

var Data =  ["ipad", "lakers", "iphone"]


var MenuList =  ["Home", "Profile",
                 "Settings",
                 "Help", "Logout"]


struct SettingsData:Identifiable, Codable {
    let  id = UUID()
    let name: String
    let imageUrl: String
}


struct DrawerTraining_Previews: PreviewProvider {
    static var previews: some View {
        DrawerTraining()
        // .preferredColorScheme(.dark)
    }
}
