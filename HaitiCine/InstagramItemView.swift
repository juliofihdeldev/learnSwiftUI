

import SwiftUI

struct InstagramItemView: View {

    var body: some View {
            VStack{
                frame( idealHeight: 200, maxHeight: 300, alignment: .leading)
                HStack{
                      VStack{
                          Image("espn")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                          .frame(idealWidth: 40, idealHeight: 40)
                          .clipShape(Circle())
                      }.frame(width: 90, height:90)
    
    
                      VStack(alignment: .leading){
                             Text("ESPN")
                             .frame(maxWidth: .infinity,
                                    alignment: .leading)
                              .font(.headline)
    
                             Text("ESPN Wide World of Sports")
                             .frame(maxWidth: .infinity, alignment: .leading)
                             .font(.body)
                      }
    
    
                      Spacer()
                          VStack(alignment: .leading){
                                     Button(action: {
                                          print("Button was tapped")
                                        }) {
                                         Image(systemName: "livephoto.play")
                                          .font(Font.system(size: 40, weight: .ultraLight))
                                          .accentColor(Color.black)
                                        }
                                 }
                      }
                  .padding(4.0)
                  .background(Color.white)
                  .clipped()// apply only on stack
                  .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
    
              HStack {
                  Image("lakers")
                              .resizable()
                              .aspectRatio(contentMode: .fit).cornerRadius(0)
                          .clipShape(Rectangle())
                      .padding(.all, 0.0)
                  }
    
              VStack{
              HStack(spacing: 16){
    
                      Button(action: {
                          print("Button was heart")
                      }) {
                         Image(systemName: "heart")
                          .font(Font.system(size: 40, weight: .ultraLight))
                          .accentColor(Color.black)
                      }
    
                      Button(action: {
                         print("Button was  message")
                      }) {
                        Image(systemName: "message")
                         .font(Font.system(size: 40, weight: .ultraLight))
                         .accentColor(Color.black)
                      }
    
                      Button(action: {
                        print("Button was icloud")
                      }) {
                       Image(systemName: "icloud")
                        .font(Font.system(size: 40, weight: .ultraLight))
                        .accentColor(Color.black)
                      }
    
    
                      Spacer()
                          Button(action: {
                                    print("Button was  pencil")
                                 }) {
                                   Image(systemName: "pencil.tip")
                                    .font(Font.system(size: 50, weight: .ultraLight))
                                    .accentColor(Color.black)
                          }
    
    
                      }
              }
              .padding(16.0)
              Spacer()
          }
    }
}

struct InstagramItemView_Previews: PreviewProvider {

    static var previews: some View {
        InstagramItemView()
    }
}
