
import SwiftUI

struct TodosList: View {
    @State var posts = [
        Post(name:"Julio",
             description:"SwiftUI day 1, pretty good. ",
             imageUrl:"lakers",
             qty: 1),
        
        Post(name:"Evens",
             description:"SwiftUI day 1, pretty good. ",
             imageUrl:"kd",
             qty: 2),
        
        
        Post(name:"Djason",
             description:"SwiftUI day 1, pretty good. ",
             imageUrl:"mahoms",
             qty: 2),
        
        Post(name:"Djason",
             description:"SwiftUI day 1, pretty good. ",
             imageUrl:"lakers2",
             qty: 2)
    ]
    
    @State var categories = [
        Category(name:"Your story",
                       imageUrl:"jul"),
        Category(name:"Iphone",
                 imageUrl:"iphone"),
        Category(name:"Ipad",
                 imageUrl:"ipad"),
        Category(name:"Apple Watch",
                 imageUrl:"watch"),
    ]
    
       
    var body: some View {
        
        VStack{
            NavigationView{
                List{
                    
                    ScrollView(.horizontal,  showsIndicators: false){
                        HStack(alignment: .center, spacing: 2.0){
                            ForEach(categories) { category in
                                CategoryItemView(category: category)
                                    
                                    .frame(width: 70)
                                    .padding(.trailing , 1)
                            }
                        }
                        
                    }
                    
                    ForEach(posts) { post in
                        NavigationLink(destination:
                        DetailsPostView(post:post)){
                            PostItemView(post: post)
                            
                        }
                        
                    }
                    
                }
                .navigationBarTitle("FEEDS", displayMode: .inline).font(.largeTitle)
                .navigationBarItems(trailing:
                    HStack {
                        Image("jul")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:40,
                                   height: 40)
                            .cornerRadius(40)
                        
                    }
                )
                
            }
            
            
        }
        
    }
    

    struct CategoryItemView: View {
        let category : Category
        
        var body: some View {
            VStack(){
                Image(category.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:60,
                           height: 60)
                    .cornerRadius(30)
                    .clipShape(Circle())
                
                Text(category.name).font(.subheadline)
                    .lineLimit(1)
            }
            
            
        }
        
    }
    
}

struct PostItemView: View {
    let post : Post
    
    var body: some View {
        VStack(){
            HStack {
                Image(post.imageUrl)
                    .resizable()
                    .frame(width:60,
                           height: 60)
                    .cornerRadius(60)
                
                VStack(alignment: .leading, spacing: 10 ){
                    Text(post.name ).font(.headline)
                    Text(post.description)
                        .font(.body)
                }
                Spacer()
            }
            
            HStack {
                Image(post.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit).cornerRadius(0)
                    .clipShape(Rectangle())
                    .padding(.all, 0.0)
            }
            
            HStack{
                
                HStack(spacing: 16){
                    
                    Button(action: {
                        print("Button was heart")
                    }) {
                        Image(systemName: "heart.fill")
                            .font(Font.system(size: 30, weight: .ultraLight))
                            
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        print("Button was  message")
                    }) {
                        Image(systemName: "message")
                            .font(Font.system(size: 30, weight: .ultraLight))
                            .accentColor(Color.black)
                    }
                    
                    Button(action: {
                        print("Button was icloud")
                    }) {
                        Image(systemName: "icloud")
                            .font(Font.system(size: 30, weight: .ultraLight))
                            .accentColor(Color.black)
                    }
                    
                    
                    Spacer()
                    Button(action: {
                        print("Button was  pencil")
                    }) {
                        Image(systemName: "pencil.tip")
                            .font(Font.system(size: 30, weight: .ultraLight))
                            .accentColor(Color.black)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}

struct TodosList_Previews: PreviewProvider {
    static var previews: some View {
        TodosList()
    }
}




