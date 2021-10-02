//
//  EditTaskView.swift
//  Statistia
//
//  Created by Prajjwal on 28/09/21.
//

import SwiftUI
import FirebaseFirestore
// opens new sheet(Edit task Sheet) and successfully delete the item in firestore

struct EditTaskView : View {
    var dbTasks = Firestore.firestore().collection("Tasks")
    var data : TaskDetails
    @Environment(\.presentationMode) var prentationMode
    @State var newShow = false
    @State var offsetter = false
    //for going back to the main view
    var body: some View{
        
            VStack{
                Text(data.title)
                    .foregroundColor(.black)
                    .font(.system(size: 32))
                    .fontWeight(.light)
                    .offset(y : offsetter ? -500 : 0)
                    
                    .padding(.bottom,60)
                HStack {
                    Text("\(Int(data.time))")
                        .font(.system(size: offsetter ? 120 : 70))
                        .foregroundColor(Color("Color1"))
                        .fontWeight(.bold)
                        
                       
                    Text(". 60").padding(.top,20)
                        .foregroundColor(offsetter ? Color("Color1") : .black)
                        .font(.system(size: offsetter ? 70 : 28))
                        
                       
                        
                }
                .padding(.bottom,80)
                .frame(alignment : .center)
                .foregroundColor(Color("Color1"))
                .rotationEffect(.degrees(offsetter ? -90 : 0))
                .offset(x : offsetter ? 50 : 0)
                .offset(y : offsetter ? 25 : 0)
                
                
                
                
                
                HStack {
                    
                    Button(action : {
                        withAnimation(){
                            offsetter.toggle()
                        }
                        
                    }){
                        Text("Start")
                            .foregroundColor(.black)
                            .font(.system(size: 27))
                            .padding(.vertical,10)
                            .frame(width:180)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                            .offset(x : offsetter ? -400 : 0)
                        
                    }
                    Button(action : {
                        let Id = data.docID
                        dbTasks.document(Id).delete()
                        newShow.toggle()
                        
                        
                    }){
                        Text("Delete it")
                            .foregroundColor(.black)
                            .font(.system(size: 27))
                            .padding(.vertical,10)
                            .frame(width:180)
                            .background(Color("Color1"))
                            .clipShape(Capsule())
                            .offset(x : offsetter ? 400 : 0)
                    }
                    .fullScreenCover(isPresented: $newShow){
                        MainView()
                }
                }
                Button(action : {
                    newShow.toggle()
                    
                }){
                    HStack {
                        Spacer()
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                            .foregroundColor(Color("Color1"))
                            .padding(.trailing,100)
                    }
                }
                .fullScreenCover(isPresented: $newShow){
                    MainView()}
                .padding(.top,100)
            }
            .frame(maxWidth : .infinity,maxHeight : .infinity)
            .background(Color.black.opacity(offsetter ? 1 : 0).edgesIgnoringSafeArea(.all))
           
            
        
        
    }
    
}


struct EditTaskView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
