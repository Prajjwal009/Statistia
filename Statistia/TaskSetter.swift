//
//  SwiftUIView.swift
//  Statistia
//
//  Created by Prajjwal on 11/07/21.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct TaskSetter: View {
    var db = Firestore.firestore()
//    @StateObject var firetaskmodel = FirebaseTaskModel()
    @Environment(\.presentationMode) var presentationMode
    @State var showingFirstView = false
   
    @State var currentTaskData = TaskDetails(title: "", time: 0)
    @State var taskTime : Double = 0.0
    @State var taskText : String = ""
    @State var taskInfoText : String = ""
    @State var taskDate  = Date()
    @State var color1 = Color("Color1")
   
    var body: some View {
        VStack(){
            HStack(alignment: .bottom){
                TextField("task",text: $currentTaskData.title)
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
                    Text("\(Int(currentTaskData.time))")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Text("min")
                        .fontWeight(.light)
                }
                .padding(.top,15)
                
            }
            .padding(.top,30)
                
      
            
            
            Slider(value: $currentTaskData.time, in : 0.0...500.0)
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
            
            
            HStack {
                Text("Priority Code")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.vertical,10)
                Spacer()
            }
            
            
            
                
            
           
              
            Spacer()
            Button(action : {
                showingFirstView.toggle()
                SaveTask()
               
                
                
                
            }){
                Text("Done")
                    .foregroundColor(color1)
                    .font(.system(size: 20))
                    
                    .frame(width : 200,height: 50)
                    
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
            }
            .fullScreenCover(isPresented: $showingFirstView, content: ContentView.init)
                
              
        }
    }
    func SaveTask(){
        db.collection("Tasks").addDocument(data: ["title" : currentTaskData.title,"time": Int(currentTaskData.time)])
//     
       
        
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSetter()
    }
}
