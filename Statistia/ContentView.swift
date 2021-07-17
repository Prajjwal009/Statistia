//
//  ContentView.swift
//  Statistia
//
//  Created by Prajjwal on 10/07/21.

//lol

//

import SwiftUI
import FirebaseFirestore

struct ContentView: View {
    var body: some View {
        MainView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(FirebaseTaskModel())
            
    }
}
struct MainView : View {
    @StateObject  var firetaskmodel = FirebaseTaskModel()
    @State var color1 = Color("Color1")
    @State var showingSheetTask = false
    @State var showStatsSheet = false
    @State var buttonIndex = 0
    @State var edit = false
    @State var id1 = 0
    @State var id2 = 0
    var dbTasks = Firestore.firestore().collection("Tasks")
    
     

    var body: some View{
        ZStack {
            VStack{
                HStack{
                    VStack(alignment : .leading) {
                        Text("Hey, xyz")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                            .font(.system(size: 35))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                        
                        let taskCount : Int = firetaskmodel.tasks.count
                        Text("\(taskCount) tasks remaining")
                            .foregroundColor(color1)
                            .padding(.horizontal)
                            .font(.headline)
                       
                    }
                    Spacer()
                    Button(action : {
                        showStatsSheet.toggle()
                        //
                        
                    }){
                    Image(systemName: "chart.bar")
                        .font(.system(size: 28))
                        .foregroundColor(color1)
                        .padding()
                    }
                    .fullScreenCover(isPresented: $showStatsSheet, content: StatsView.init)
                    
                    Button(action : {
                        showingSheetTask.toggle()
                        
                    }){
                    Image(systemName: "plus")
                        .font(.system(size: 28))
                        .foregroundColor(color1)
                        .padding()
                    }
                    .fullScreenCover(isPresented : $showingSheetTask,content : TaskSetter.init)
                }
                .padding(.bottom,10)
                //today n tomorrow
                
                HStack{
                    Button(action : {
                        self.buttonIndex = 0
                        
                    }){
                        Text("Today")
                            .foregroundColor(buttonIndex == 0 ? .white : .black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .frame(width : (UIScreen.main.bounds.width-100)/2)
                        
                        
                    }
                    .background(buttonIndex == 0 ? color1 : .clear)
                    .clipShape(Capsule())
                    
                    
                    
                    
                    Button(action : {
                        self.buttonIndex = 1
                        
                        
                        
                    }){
                        Text("Tomorrow")
                            .foregroundColor(buttonIndex == 1 ? .white : .black)
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                            .padding(.vertical,10)
                            .frame(width : (UIScreen.main.bounds.width-100)/2)
                        
                        
                    }
                    .background(buttonIndex == 1 ? color1 : .clear)
                    .clipShape(Capsule())
                }
                .background(Color.gray.opacity(0.25))
                .clipShape(Capsule())
                .padding(.bottom,10)
                
                Rectangle()
                    .foregroundColor(color1)
                    .frame(width : UIScreen.main.bounds.width - 50 ,height: 2)
                    
                ScrollView{
                    
                    ForEach(firetaskmodel.tasks, id: \.self){task in
                        
                        
                       
                        LazyVStack{
                            ZStack{
                                
                               
                            
                            TabCardView(taskName: task.title, taskInfo: task.info, taskTime: Int(task.time))
                                .animation(.easeIn)
                                .onTapGesture {
                                    let Id = task.docID
                                    let docD = dbTasks.document(Id)
                                    docD.delete()
                                    renewData()
                                    self.firetaskmodel.fetchData()
                                    
                                }
                               
                               
                             
                            }
                            
                            
                        }
                        
                        
                    }
                    
                    
                    
                    
                }
                
                .onAppear(){
                
                    self.firetaskmodel.fetchData()
                        
                    
                }
                
               
            }.environmentObject(firetaskmodel)
            
        }
        
       
        
   //renews the Tasks
        
    }
    func renewData(){
        firetaskmodel.tasks.removeAll()
    }
}

struct TabCardView : View {
    @State var taskName : String = ""
    @State var taskInfo : String = ""
    @State var taskTime : Int = 0
    
    
    var color1 = Color("Color1")
    var body: some View{
        ZStack {
            
            
            HStack {
                VStack(alignment : .leading){
                    
                    
                    Text(taskName)
                        .fontWeight(.medium)
                        .foregroundColor(color1)
                        .font(.system(size: 28))
                        .padding(.top,15)
                        
                    
                    Text(taskInfo)
                        .fontWeight(.light)
                        .padding(.top,1)
                        
                    
                }
                .padding(.vertical)
                .padding(.horizontal,23)
                Spacer()
                
                
                VStack {
                   
                    Text("\(taskTime)")
                        .font(.system(size: 31))
                        .fontWeight(.light)
                    
                        .padding(.horizontal,30)
                }
                
            }
            
           
            
            
            .frame(height : 120)
            
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
           
            
        }
        
        
        
       
        
        
    }
}
