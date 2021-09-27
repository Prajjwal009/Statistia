//
//  TaskDashView.swift
//  Statistia
//
//  Created by Prajjwal on 16/07/21.
//

import SwiftUI
import FirebaseFirestore
import Combine

struct TaskDashView: View {
    var db = Firestore.firestore().collection("Tasks")
    @StateObject var firetaskmodel = FirebaseTaskModel()
    
    
    var data : TaskDetails
   
    
    @State var color1 = Color("Color1")
    var body: some View {
        HStack(){
            Button(action : {
                
            }){
            Text("start")
                .foregroundColor(color1)
                .font(.system(size: 30))
                .fontWeight(.semibold)
               
            }
            .padding()
            Rectangle()
                .frame(width : 2 ,height : 50)
          
                
            
            Button(action : {
                
            }){
            Text("edit")
                .foregroundColor(color1)
                .font(.system(size: 30))
                .fontWeight(.semibold)
            }
            .padding()
            Rectangle()
                .frame(width : 2 ,height : 50)
            
            Button(action : {
                
//                print("lol")
                let Id = data.docID
                db.document(Id).delete()
                firetaskmodel.tasks.removeAll()
                firetaskmodel.deleteItem.toggle()
               
               
                
               
                
            }){
                Image(systemName: "trash")
                    .foregroundColor(color1)
                    .font(.system(size: 30))
                    
            }
            .animation(.easeInOut)
            
            .padding()
           
            
            
        }
        
        .frame(width : 380 ,height : 120)
        
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
        .padding(.top)
        
        
       
        
    }
  
   
  
    
    struct TaskDashView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

