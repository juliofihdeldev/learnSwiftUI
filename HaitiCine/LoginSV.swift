import SwiftUI

struct LoginSV: View {
    @State var showTravel : Bool = false
    var body: some View {
        
        ZStack{
            LinearGradient(gradient:
                .init(colors:[
                    Color("Color"),
                    Color("Color1"),
                    Color("Color2")
                ]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            
            if showTravel{
                Travel()
            }else{
            
            if UIScreen.main.bounds.height > 800{
                AuthOptions(showTravel: self.$showTravel)
            } else {
                ScrollView{
                    AuthOptions(showTravel: self.$showTravel)
                }
            }
            
           
            }
        }
        
        
    }
}



struct AuthOptions: View {
    @State var index  = 0;
    @Binding var showTravel: Bool
    var body: some View {
        VStack() {
           
            Image("beach")
                .resizable()
                .frame(width: 130 , height: 150)
                .aspectRatio(contentMode:   .fit)
            
            HStack {
                
                Button(action :{
                    withAnimation(.spring(response: 0.8,
                                          dampingFraction: 0.5,
                                          blendDuration: 0.5)){
                                            self.index = 0
                    }
                    
                }){
                    Text("Existing")
                        .foregroundColor(self.index == 0  ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: ( (UIScreen.main.bounds.width - 50) / 2))
                }
                .background(
                    self.index == 0 ?
                        Color.white : Color.clear)
                    .clipShape(Capsule())
                
                
                Button(action :{
                    
                    withAnimation(.spring(response: 0.8,
                                          dampingFraction: 0.5,
                                          blendDuration: 0.5)){
                                            self.index = 1
                    }
                    
                }){
                    Text("New")
                        
                        .foregroundColor(self.index == 1  ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50 ) / 2)
                }
                .background(
                    self.index == 1 ?
                        Color.white: Color.clear)
                    .clipShape(Capsule())
                
            }
            .background(Color.black.opacity (0.1))
            .clipShape(Capsule())
            .padding(.top ,25)
            
            HStack{
                
                if self.index == 0 {
                    LoginForm(showTravel: self.$showTravel)
                } else {
                    RegisterForm(showTravel: self.$showTravel)
                }
            }.padding(10)
            
            if self.index == 0 {
                
                Button(action: {}){
                    Text("Forget password ?")
                        .foregroundColor(.white)
                    
                }.padding(.top, 20)
                
            }
            HStack (spacing: 3){
                Color.white.opacity(0.7)
                    .frame(width: 30, height: 1)
                Text("Or")
                    .foregroundColor(.white)
                Color.white.opacity(0.7)
                    .frame(width: 30, height: 1)
                
            }.padding(.top,10)
            
            HStack(spacing: 12){
                Button(action:{}){
                    
                    Image("facebook")
                        .renderingMode(.original)
                        .frame(width: 60 , height:60)
                    
                }.background(Color.white)
                    .clipShape(Circle())
                
                Button(action:{}){
                    
                    Image("google")
                        .renderingMode(.original)
                        .frame(width: 30 , height:30)
                        .padding()
                }.background(Color.white)
                    .clipShape(Circle())
            }
            
            
            
        }
        
        
        
    }
}


struct LoginForm : View {
    @State var email  = "";
    @State var pass   = "";
    @Binding var showTravel: Bool
    var body: some View {
        
        VStack{
            VStack{
                
                HStack (spacing: 15){
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter email Addres",
                              text: self.$email)
                    
                }.padding(.vertical , 20)
                
                Divider()
                
                HStack (spacing: 15){
                    Image(systemName: "lock").resizable().frame(width: 15,
                                                                height: 18)
                        .foregroundColor(.black)
                    SecureField("Enter password",
                                text: self.$pass)
                    
                    
                    Button(action:{} ){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                        
                    }
                    
                    
                    
                }.padding(.vertical , 20)
                
            }.padding(.vertical)
                .padding(.horizontal, 20)
                .padding(.bottom , 40)
                .background(Color(.white))
                .cornerRadius(10)
                .padding(.top, 25)
            
            VStack{
                
                
                Button (action: {
                    withAnimation {
                        print("user clic to login")
                        self.showTravel = true
                        
                    }
                    
                }){
                    Text("LOGIN ")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }.background(LinearGradient (
                    gradient: .init(colors: [
                        Color("Color1"),
                        Color("Color"),
                        Color("Color2"),
                        ]
                        
                    ), startPoint: .leading, endPoint: .trailing
                )
                    .cornerRadius(8)
                    
                    
                    .shadow(radius: 15)
                )
                
            }.offset(y : -40)
            
            
        }
    }
}


struct RegisterForm : View {
    @State var email  = "";
    @State var pass   = "";
        @Binding var showTravel: Bool
    var body: some View {
        
        VStack{
            VStack{
                
                HStack (spacing: 15){
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    TextField("Enter Email Addres",
                              text: self.$email)
                    
                }.padding(.vertical , 20)
                
                Divider()
                
                HStack (spacing: 15){
                    Image(systemName: "lock").resizable().frame(width: 15,
                                                                height: 18)
                        .foregroundColor(.black)
                            SecureField("Enter password",
                                text: self.$pass)
                
                    Button(action:{} ){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }.padding(.vertical , 20)
                
                Divider()
                
                HStack (spacing: 15){
                    Image(systemName: "lock").resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    SecureField("Re-Enter password",
                                text: self.$pass)
                    
                    Button(action:{} ){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                        
                    }
                    
                    
                }.padding(.vertical , 20)
            }.padding(.vertical)
                .padding(.horizontal, 20)
                .padding(.bottom , 40)
                .background(Color(.white))
                .cornerRadius(10)
                .padding(.top, 25)
            
            VStack{
                
                Button (action: {
                    self.showTravel = true
                }){
                    Text("SIGN UP")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }.background(LinearGradient (
                    gradient: .init(colors: [
                        Color("Color1"),
                        Color("Color"),
                        Color("Color2"),
                        ]
                        
                    ), startPoint: .leading, endPoint: .trailing
                )
                    .cornerRadius(8)
                    
                    .shadow(radius: 15)
                )
            }
            .offset(y : -40)
        }
    }
}


struct LoginSV_Previews: PreviewProvider {
    static var previews: some View {
        LoginSV()
    }
}
