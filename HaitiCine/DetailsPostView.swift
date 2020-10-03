

import SwiftUI

struct DetailsPostView: View {
    let post : Post
    var body: some View {
        VStack (alignment: .leading){
            
            Image(post.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
            
            
            HStack(alignment: .center){
                Image(post.imageUrl)
                    .resizable()
                    .frame(width:40,
                           height: 40)
                    .cornerRadius(40)
                Text(post.description)
                    .font(.body)
            }
            .edgesIgnoringSafeArea(.top)
            
        }
        .navigationBarTitle(
            Text(post.name),
            displayMode: .inline
        )
    }
}

struct DetailsPostView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsPostView(post:
            Post(name:"Julio",
                 description:"description julior",
                 imageUrl:"mages url",
                 qty: 1))
    }
}
