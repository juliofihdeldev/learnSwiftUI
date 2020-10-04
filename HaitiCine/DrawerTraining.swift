import SwiftUI

struct DrawerTraining: View {
    @State var index = "Home"
    @State var show = false
    
    
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
                
                
                ZStack(alignment: .topTrailing){
                    
                    MainView(show: self.$show)
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
    var body : some View{
        VStack(spacing:0){
            ZStack{
                HStack{
                    
                    Button(action: {
                        print("Menu tap")
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
                        print("Menu dot")
                    }){
                        Image("dot")
                            .resizable()
                            .frame(width:24, height: 24)
                            .foregroundColor(.black)
                    }
                }
                
                Text("Food")
                    .fontWeight(.bold)
                    .font(.title    )
            }
            .padding(.horizontal)
            .padding(.vertical, 10 )
            
            ZStack{
                Home()
            }
            
        }.background(Color.white)
    }
}


struct Home : View{
    var body : some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:18){
                ForEach(Data, id: \.self){i in
                    Image(i)
                        
                        .resizable()
                        
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(20)
                    
                }
            }.padding(.top, 8)
                .padding(.horizontal)
        }
    }
}

var Data =  ["ipad", "lakers", "iphone"]


var MenuList =  ["Home", "Profile",
                 "Settings",
                 "Help", "Logout"]






















struct DrawerTraining_Previews: PreviewProvider {
    static var previews: some View {
        DrawerTraining()
    }
}
