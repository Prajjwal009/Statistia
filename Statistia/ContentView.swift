//
//  ContentView.swift
//  Statistia
//
//  Created by Prajjwal on 10/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct MainView : View {
    @State var index = 0
    var body: some View{
        ZStack {
            VStack{
                HStack{
                    Text("Hey, xyz")
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .padding()
                    Spacer()
                    Image(systemName: "plus")
                        .font(.system(size: 28))
                        .padding()
                }
                .padding(.bottom,18)
                
                HStack{
                    Button(action : {
                        self.index = 0
                        
                    }){
                        Text("Today")
                            .foregroundColor(index == 0 ? .white : .black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .frame(width : (UIScreen.main.bounds.width-100)/2)
                        
                        
                    }
                    .background(index == 0 ? Color.black : .clear)
                    .clipShape(Capsule())
                    
                    
                    
                    
                    Button(action : {
                        self.index = 1
                        
                        
                        
                    }){
                        Text("Tomorrow")
                            .foregroundColor(index == 1 ? .white : .black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .frame(width : (UIScreen.main.bounds.width-100)/2)
                        
                        
                    }
                    .background(index == 1 ? Color.black : .clear)
                    .clipShape(Capsule())
                }
                .background(Color.gray.opacity(0.1))
                .clipShape(Capsule())
                .padding(.bottom)
                
                TabCardView(taskName: "Chapter 4", taskInfo: "dlf", taskTime: 90)
                TabCardView(taskName: "Website", taskInfo: "dlf", taskTime: 90)
                Spacer()
            }
        }
    }
}

struct TabCardView : View {
    @State var taskName : String = ""
    @State var taskInfo : String = ""
    @State var taskTime : Int = 0
    var body: some View{
        HStack {
            VStack(alignment : .leading){
                
                
                Text(taskName)
                    .fontWeight(.regular)
                    .font(.system(size: 28))
                    
                
                Text(taskInfo)
                    .fontWeight(.light)
                
            }
            .padding(.vertical)
            .padding(.horizontal)
            Spacer()
            
            
            Text("\(taskTime)")
                .font(.system(size: 28))
                .fontWeight(.light)
            
                .padding(.horizontal,30)
        }
        .frame(height : 120)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.bottom)
        
       
        
        
    }
}
