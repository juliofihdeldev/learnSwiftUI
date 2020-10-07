import SwiftUI

struct UsersSwiftUIView: View {
    
    @State var users: [Users] = []
    var body: some View {
        GeometryReader{_ in
            VStack (alignment :.leading){
                List(self.users) { user in
                    UserItem(user:user
                    )
                }.onAppear{
                    Api().getPost{ (users) in
                        self.users = users
                    }
                }
            }.navigationBarTitle("Handle nested json ")
        }
    }
}


struct UserItem : View {
    let user : Users
    
    var body: some View{
        HStack (alignment: .center){
            Image(systemName: "person.circle").font(.largeTitle)
            
            VStack(alignment: .leading){
                Text(user.username).font(.subheadline)
                Text(user.email).font(.body)
                
                
                VStack (alignment:.leading){
                    Text(user.company.name).font(.body).fontWeight(.bold);
                    Text(user.company.catchPhrase).font(.body).fontWeight(.semibold)
                }
                
                VStack (alignment:.leading) {
                    Text(user.address.city).font(.body);
                    Text(user.address.street).font(.body);
                    Text(user.address.suite).font(.body);
                    Text(user.address.zipcode).font(.body);
                }
                .padding(.top)
                .padding(.bottom)
                
            }.frame(width: 260)
            
            HStack{
                Button(action: {
                    
                    callUser(phoneNumber: self.user.phone)
                    
                }) {
                    Image(systemName: "video")
                        .font(Font.system(size: 30, weight: .ultraLight))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(12)
        
    }
}

func callUser (phoneNumber : String) {
    
    let telephone = "tel://"
    let formattedString = telephone + phoneNumber
    guard let url = URL(string: formattedString) else { return }
    UIApplication.shared.open(url)
    
}



struct UsersSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UsersSwiftUIView()
    }
}
