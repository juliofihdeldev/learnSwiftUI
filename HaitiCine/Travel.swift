import SwiftUI
import KingfisherSwiftUI

struct Travel: View {
    
    var body: some View {
        VStack{
            Main()
        }
    }
}


struct Main: View {
    @State var tab =  "Explore"
    @State var show = false
    @State var selected : Model = data[0]
    //    @Namespace var animation
    
    var body: some View {
        
        ZStack{
            
            VStack(spacing:0){
                
                if tab == "Explore" {
                    HomeView(show: $show,
                             selected: $selected
                            )
                }else if tab == "Liked"{
                    LikedView(show: $show,
                              selected: $selected)
                }else {
                    
                    ProfileViewSettings()
                }
                
                Spacer()
                
                HStack(spacing: 0) {
                    tabButton(title: "Explore", tab: $tab)
                    Spacer(minLength: 0)
                    
                    tabButton(title: "Liked", tab: $tab)
                    Spacer(minLength: 0)
                    
                    tabButton(title: "Account", tab: $tab)
                    Spacer(minLength: 0)
                }
                .padding(.top)
                    // Handle small size iphones...
                    .padding(.bottom,
                             UIApplication.shared.windows.first!.safeAreaInsets.bottom  == 0 ? 15 :
                                UIApplication.shared.windows.first!.safeAreaInsets.bottom
                        
                ).padding(.horizontal , 35)
                    .background(Color.white)
                    .clipShape(RoundedShape(corners: [.topLeft, .topRight] ))
                
            }
            
            // Details view
            if show{
                
                Detail(selected: $selected, show: $show)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .background(Color(.white)
        .edgesIgnoringSafeArea(.all))
    }
}

struct tabButton: View {
    
    var title : String
    @Binding var tab : String
    
    var body: some View {
        
        HStack(spacing : 8){
            
            Button (action:{
                //                withAnimation(.spring()){}
                self.tab = self.title
            }){
                Image(title)
                    .resizable()
                    .renderingMode(.template )
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode:  .fit)
                    .foregroundColor(tab == self.title ? .white : .gray)
                
                Text(tab == title ? title : "")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color("Color1").opacity(tab == self.title ? 1 : 0))
            .clipShape(Capsule())
        }
        
    }
}

struct RoundedShape: Shape {
    // resuable ....
    var corners : UIRectCorner
    func path(in rect : CGRect) -> Path{
        
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: 45, height: 45)
        )
        return Path(path.cgPath)
    }
}

struct HomeView: View {
    
    @Binding var show : Bool
    @Binding var selected : Model
    
    //    var animation :Namespace.ID
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false ){
            VStack(alignment: .leading){
                
                Header()
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing:15){
                        
                        ForEach(data){ travelIcon in
                            
                            KFImage(URL(string: travelIcon.img)!)
                                .resizable()
                                .renderingMode(.original)
                                .frame(width: 60, height: 60)
                                .cornerRadius(60)
                                .foregroundColor(.white)
                                .padding(2)
                                .background(Color("Color1"))
                                .clipShape(Circle())
                            
                        }
                        
                    }.padding()
                    
                }
                
                HStack{
                    Text("Destinations")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("See All")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                
                
                ForEach(data){ travel in
                    ZStack(alignment: Alignment(horizontal:.trailing,vertical: .top)){
                        KFImage(URL(string: travel.img)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame( width:
                                UIScreen.main.bounds.width  - 16
                                , height: 300)
                            .cornerRadius(25)
                        //                        .matchedGeometryEffect(id: travel.img,in :animation )
                        
                        
                        VStack(alignment: .trailing, spacing: 8){
                            Text(travel.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .shadow(color: .gray, radius: 2)
                            //                            .matchedGeometryEffect(id: travel.title,
//                            in :animation )
                            
                            
                            Text(travel.country)
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .gray, radius: 5)
                            
                            //                                                        .matchedGeometryEffect(id: travel.country,
                            //                                                                                                         in :animation )
                            //
                            
                        }.padding()
                        
                    }
                    .padding()
                        
                    .onTapGesture {
                        
                        withAnimation(.spring()){
                            self.selected = travel
                            self.show.toggle()
                        }
                    }
                    
                }
                
            }
        }
    }
}


struct Header: View {
    var body : some View {
        HStack {
            Text("Discovery a \ndireferent  world!")
                
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(Color("Color1"))
            
            Spacer()
            
            Button(action: {}){
                Image("search").resizable()
                    .renderingMode(.template)
                    
                    .foregroundColor(.white)
                    .frame(width: 24, height: 24)
                    
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .background(Color("Color1"))
                    .clipShape(Circle())
            }
            
        }
        .padding()
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
    }
}

struct Detail: View {
    @Binding var selected : Model
    @Binding var show : Bool
    //    var animation : Namespace.ID
    
    var body: some View {
        
        VStack{
            
            VStack {
                
                ZStack (alignment:
                    Alignment(horizontal:.center,
                              vertical:.top)){
                                KFImage(URL(string: selected.img)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame( width:
                                        UIScreen.main.bounds.width
                                        , height: 300)
                                    .cornerRadius(25)
                                    .clipShape(
                                        RoundedShape(corners: [.bottomLeft, .bottomRight])
                                        //                                         .matchedGeometryEffect(id: travel.img,in :animation )
                                )
                                Spacer(minLength: 0)
                                
                                HStack{
                                    Button(action: {
                                        withAnimation(.spring()){
                                            self.show.toggle()
                                        }
                                    }){
                                        Image(systemName: "chevron.left")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .shadow(color: .gray, radius: 2)
                                        
                                    }
                                    
                                    Spacer()
                                    Button(action: {}){
                                        Image(systemName: "suit.heart")
                                            .font(.title)
                                            .foregroundColor(.white)
                                            .shadow(color: .gray, radius: 2)
                                        
                                    }
                                }
                                .padding()
                                .padding(.top,20)
                                
                }
                
            }.background(Color.white)
            // Details view
            
            HStack(alignment: .top){
                
                VStack(alignment: .leading){
                    
                    Text(selected.title)
                        .font(.title)
                        .foregroundColor(Color("Color1"))
                        .fontWeight(.bold)
                    //                    .matchedGeometryEffect(id: travel.img,in :animation )
                    
                    
                    HStack (spacing:10){
                        
                        Image("Explore")
                            .resizable()
                            .renderingMode(.template )
                            .frame(width: 20, height: 20)
                            .aspectRatio(contentMode:  .fit)
                        
                        
                        Text(selected.title)
                            .foregroundColor(.black)
                        
                        
                        HStack (spacing: 5){
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text(selected.rating)
                                .foregroundColor(.black)
                        }
                        
                    }
                    
                    HStack (){
                        VStack (alignment: .leading){
                            
                            
                            Text("Description")
                                .font(.title)
                                .foregroundColor(.black)
                                .padding(.horizontal,0)
                                .padding(.bottom, 12)
                            
                            VStack (alignment: .center){
                                
                                Text("What I find remarkable is that this text has been the industry's standard dummy text ever since some printed in the 1500s took a galley of type and scrambled it to make a type specimen book; .")
                                    
                                    .font(.body)
                                    .fontWeight(.thin)
                                    .multilineTextAlignment(.leading)
                                //                                .matchedGeometryEffect(id: travel.title,in :animation )
                                
                            }
                            
                            Spacer(minLength: 0)
                            
                            HStack(){
                                Spacer(minLength: 0)
                                
                                Button(action:{
                                    self.show.toggle()
                                    
                                }){
                                    Text("Book Now")
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(.vertical)
                                        .frame(width:UIScreen.main.bounds.width - 220)
                                        .background(Color("Color1"))
                                        .clipShape(Capsule())
                                }
                            }.padding()
                        }
                        
                    }
                    
                }
                Spacer(minLength:0)
                Text(selected.price)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }.padding()
            
            
            Spacer(minLength:0)
        }
        .background(Color(.white))
        
    }
}

struct LikedView: View {
    
    @Binding var show : Bool
    @Binding var selected : Model
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false ){
                
                Header()
                
                HStack{
                    Text("Liked")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {}){
                        Text("See All")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                
                VStack(alignment: .leading){
                    
                    ForEach(data){ travel in
                        ZStack(alignment: Alignment(horizontal:.trailing,vertical: .top)){
                            KFImage(URL(string: travel.img)!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame( width:
                                    UIScreen.main.bounds.width  - 16
                                    , height: 300)
                                .cornerRadius(25)
                            
                            
                            VStack(alignment: .trailing, spacing: 8){
                                Text(travel.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 2)
                                
                                
                                Text(travel.country)
                                    .font(.body)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .shadow(color: .gray, radius: 5)
                                
                                //                            .matchedGeometryEffect(id: travel.country,
                                //                                                                             in :animation )
                                
                                
                            }.padding()
                            
                        }
                        .padding()
                            
                        .onTapGesture {
                            
                            withAnimation(.spring()){
                                self.selected = travel
                                self.show.toggle()
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
}


struct ProfileViewSettings: View {
    var body: some View {
        HStack {
            
            VStack{
                
                HStack {
                    
                    VStack (alignment: .leading ){
                        Text("Hi , I'm Julio ")
                            
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color("Color1"))
                        Text("Join in 2019 ")
                            
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color(.black))
                    }
                    Spacer()
                    
                    Button(action: {}){
                        Image("jul").resizable()
                            .renderingMode(.original)
                            
                            .foregroundColor(.white)
                            .frame(width: 60, height: 60)
                            .cornerRadius(60)
                            .aspectRatio(contentMode: .fit)
                            .padding(1)
                            .background(Color("Color1"))
                            .clipShape(Circle())
                    }
                    
                }.padding()
                
                
                Divider()
                    .frame(height: 0.5)
                    .padding(.horizontal, 30)
                    .background(Color("Color1"))
                
                VStack {
                    
                    
                    HStack{
                        Text("Personal information")
                        Spacer()
                        Button(action: {}){
                            Image(systemName: "person")
                                .font(.title).foregroundColor(.gray)
                        }
                        
                    }.padding()
                    
                    HStack{
                        Text("Payment and payouts")
                        Spacer()
                        Button(action: {}){
                            Image(systemName: "creditcard")
                                
                                .font(.title).foregroundColor(.gray)
                        }
                        
                    }.padding()
                    
                    HStack{
                        Text("Notifications")
                        Spacer()
                        Button(action: {}){
                            Image(systemName: "bookmark")
                                
                                .font(.title).foregroundColor(.gray)
                        }
                        
                    }.padding()
                    
                    HStack{
                        Text("Log out")
                            .foregroundColor(Color.blue).opacity(0.5)
                        Spacer()
                        
                        
                    }.padding()
                    
                    
                    
                    
                }
                
            }
            
        }
        .padding()
        .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
        
        
    }
}



struct AccountView: View {
    var body: some View {
        LoginSV()
        
    }
}

struct Travel_Previews: PreviewProvider {
    static var previews: some View {
        Travel()
    }
}

struct Model: Identifiable {
    var id  = UUID().uuidString
    var title , country , rating, price, img : String
}

var data = [
    
    Model(title: "Bassin Bleu of Furcy", country: "Haiti", rating: "4.5", price: " $199", img: "https://live.staticflickr.com/7649/17264601741_50f3617817_z.jpg"),
    
    Model(title: "La statue du Christ Rédempteur  ", country: "Brésil", rating: "4.5", price: " $199", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2Fd2bd420c-352b-4828-9135-e77aaaefe118.2Ejpeg/798x450/quality/65/14-la-statue-du-christ-redempteur-a-rio-de-janeiro-bresil.jpg"),
    
    Model(title: "La Mosquée bleue à Istanbul, ", country: "Turquie", rating: "4.8", price: "$299", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2F11f1ca36-6718-4566-bdfd-9a1c1772c862.2Ejpeg/904x600/quality/65/11-la-mosquee-bleue-a-istanbul-turquie.jpg"),
    
    Model(title: "L'Arc de triomphe à Paris, ", country: "France", rating: "5", price: "499", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2Ff20e846f-11be-4ff6-8fcf-6f5b763aa567.2Ejpeg/676x450/quality/65/4-l-arc-de-triomphe-a-paris-france.jpg"),
    
    Model(title: "La Grande pyramide de Gizeh, Egypte", country: "Egypte", rating: "5", price: "$899", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2019.2F01.2F03.2F5f800fb5-91d5-47a2-bf83-4288d3f11201.2Ejpeg/733x450/quality/65/15-la-grande-pyramide-de-gizeh-egypte.jpg"),
    
    Model(title: "La tour Eiffel à Paris,", country: "France", rating: "5", price: "$799", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2F653698cd-7abb-4f4b-9188-7f677838867d.2Ejpeg/679x450/quality/65/5-la-tour-eiffel-a-paris-france.jpg"),
    
    Model(title: "Le Vatican à Rome", country: "Italie", rating: "5", price: "$399", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2F8db4ac50-6514-48c5-9471-512b4d975571.2Ejpeg/600x450/quality/65/13-le-vatican-a-rome-italie.jpg"),
    
    Model(title: "Le pont du Golden Gate à San Francisco, Etats-Unis", country: "Ayiti", rating: "5", price: "$499", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2F03a50a27-5816-4ded-b567-6628e0b8a4b0.2Ejpeg/1012x600/quality/65/9-le-pont-du-golden-gate-a-san-francisco-etats-unis.jpg"),
    
    Model(title: "L'opéra de Sydney", country: "Australie", rating: "5", price: "$1499", img: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2FGEO.2F2019.2F09.2F20.2Ff9114492-c2b0-4269-9658-56e177ffed90.2Ejpeg/900x600/quality/65/10-l-opera-de-sydney-australie.jpg"),
    
]






