//
//  SwiftUIView.swift
//  Statistia
//
//  Created by Prajjwal on 11/07/21.
//

import SwiftUI

struct TaskSetter: View {
    @Environment(\.presentationMode) var presentationMode
    @State var taskTime : Double = 0.0
    @State var taskText : String = ""
    @State var taskInfoText : String = ""
    @State var taskDate  = Date()
    @State var color1 = Color("Color1")
    var body: some View {
        VStack{
            HStack(alignment: .bottom){
                TextField("task",text: $taskText)
                    .padding(.horizontal)
                    .padding(.top,20)
                    .frame(height : 80)
                  
                    .foregroundColor(.black)
                    
                    .cornerRadius(10)
                    .font(.system(size: 35))
                    .padding(.horizontal,5)
                    
                    
                    
            }
            Rectangle()
                .frame(width : UIScreen.main.bounds.width - 10 ,height: 2)
            
            TextField("about it",text : $taskInfoText)
                .font(.system(size: 20))
                
                .padding(.horizontal)
                
                .frame(height : 60)
                .background(Color.gray.opacity(0.16))
                .cornerRadius(15)
                .shadow(radius: 50)
                .padding(.top)
                .padding(.horizontal,10)
            
            HStack {
                Text("Time Duration")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            
            
            ZStack{
                
                Circle().stroke(Color.purple,lineWidth: 2)
                    .frame(width : 150, height :150)
                    .foregroundColor(color1)
                    
                VStack(alignment : .center){
                    Text("\(Int(taskTime))")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Text("min")
                        .fontWeight(.light)
                }
                .padding(.top,18)
                
            }
            .padding(.top,30)
                
      
            
            
            Slider(value: $taskTime, in : 0...500)
                .padding()
                .accentColor(color1)
            HStack{
                Text("Date")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                
                DatePicker("",selection : $taskDate,in : Date()...)
                    .accentColor(color1)
            }
            .padding()
            .padding(.vertical,10)
            
            
                
            
           
              
            Spacer()
            Button(action : {
                presentationMode.wrappedValue.dismiss()
                
                
            }){
                Text("Done")
                    .foregroundColor(color1)
                    .font(.system(size: 20))
                    
                    .frame(width : 200,height: 50)
                    
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            }
                
              
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSetter()
    }
}
