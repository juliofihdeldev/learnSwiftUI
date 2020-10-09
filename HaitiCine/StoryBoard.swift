//
//  StoryBoard.swift
//  HaitiCine
//
//  Created by Julio Jean Fils on 9/10/20.
//  Copyright © 2020 Julio Jean Fils. All rights reserved.
//

import SwiftUI

struct StoryBoard: View {
    @State var goTohome = false
    
    var body: some View {
        ZStack{
            if goTohome{
                Text("Go to home path")
            }else{
                Board(goTohome : self.$goTohome)
            }
        }.onReceive(NotificationCenter.default.publisher(for: Notification.Name("success")), perform:{ _ in
            withAnimation{self.goTohome = true}
            
            
        })
       
    }
}

struct Board : View {
    @State var maxWidth = UIScreen.main.bounds.width - 100
    @State var offset  : CGFloat = 0
    @Binding var goTohome : Bool
    
    var body: some View{
        ZStack{
            
            VStack{
                Spacer(minLength: 0)
                
                Text(" SMART LEARN")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.leading, 30)
                
                
                Text("Don't waste your time. Learn something new  with our app and make your skill better")
                    
                    .foregroundColor(.gray)
                    .padding()
                    .padding(.bottom)
                    .frame(height: 100)
                Image("storyboard1").resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:400, height: 400)
                
                Spacer(minLength: 0)
                
                // slides
                ZStack{
                    Capsule()
                        .fill(Color.black.opacity(0.1))
                    
                    // back ground ocll
                    Text("SWIPE TO START")
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.leading, 30)
                    
                    HStack {
                        Capsule().fill(Color.red)
                            .frame(width: calculWidth() + 65 )
                        Spacer(minLength: 0)
                    }
                            
                            
                    HStack{
                        ZStack{
                            
                            Image(systemName: "chevron.right")
                            .font(Font.system(size: 30 )).foregroundColor(.white)
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                            .font(Font.system(size: 30)).foregroundColor(.white)
                            
                        }.foregroundColor(Color.red)
                            .offset(x:5)
                            .frame(width: 65, height: 65)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: offset)
                            .gesture(
                                DragGesture().onChanged(    onChanded(value:))
                                    .onEnded(onEnd(value:))
                        )
                        
                        Spacer()
                    }
                }
                
            }
        }
        .frame(width: maxWidth, height: 65)
        .padding(.bottom)
        .edgesIgnoringSafeArea(.all)
    }
    func calculWidth () -> CGFloat{
        let percent = offset / maxWidth
        return percent * maxWidth
    }
    
    
    func onChanded(value: DragGesture.Value){
       

                             
        if value.translation.width > 0 && offset <= maxWidth - 65{
            offset = value.translation.width
             
        }
    }
    
    func onEnd(value: DragGesture.Value){
    
        withAnimation(Animation.easeOut(duration: 0.3)){
         
        
            if offset > 180 {
                offset = maxWidth - 65
                // Notify system
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                    NotificationCenter.default.post(name:NSNotification.Name("success"), object: nil)
                }
               
                self.goTohome = true
                
            }else{
                offset = 0
            }
        }
    }
    
}


struct StoryBoard_Previews: PreviewProvider {
    static var previews: some View {
        StoryBoard()
    }
}
