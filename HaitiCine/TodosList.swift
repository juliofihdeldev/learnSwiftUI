
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
                    ForEach(posts) { post in
                        NavigationLink(destination:
                        DetailsPostView(post:post)){
                            PostItemView(post: post)
                            
                        }
                        
                    }
                    
                }
            .navigationBarTitle("POST FEEDS")
                    .navigationBarItems(trailing:
                        HStack {
                            Image("user")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:60,
                                       height: 60)
                        }
                )
                
            }
            
            //            ScrollView(.horizontal,  showsIndicators: false){
            //                           HStack(alignment: .center, spacing: 12.0){
            //                               ForEach(categories) { category in
            //                                   CategoryItemView(category: category)
            //
            //                                       .frame(width: 120)
            //                                       .padding(.trailing , 10)
            //                               }
            //                           }
            //
            //                }
        }
    }
    
    
    
    
    
    
    struct CategoryItemView: View {
        let category : Category
        
        var body: some View {
            VStack(){
                Image(category.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:120,
                           height: 120)
                
                
                Text(category.name).font(.title)
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




