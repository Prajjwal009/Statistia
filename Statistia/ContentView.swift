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
    @State var backcolor = LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]), startPoint: .topTrailing, endPoint: .center)
    
    
    @State var color1 = Color("Color1")
    @State var showingSheetTask = false
    @State var showStatsSheet = false
    @State var buttonIndex = 0
    @State var edit1 = false
    
   
   
    var dbTasks = Firestore.firestore().collection("Tasks")
    
     

    var body: some View{
        ZStack {
            VStack{
                HStack{
                    VStack(alignment : .leading) {
                        Text("Hey PJ")
                            .font(.custom("Futura", size: 35))
                            .foregroundColor(.white)
                            .fontWeight(.light)
                            .font(.system(size: 35))
                            .padding(.horizontal)
                            .padding(.vertical,10)
                        
                        let taskCount : Int = firetaskmodel.tasks.count
                        Text("\(taskCount) tasks remaining")
                            .font(.custom("Futura", size: 18))
                            .fontWeight(.bold)
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
                        .foregroundColor(.white)
                        .padding()
                    }
                    .fullScreenCover(isPresented: $showStatsSheet, content: StatsView.init)
                    
                    Button(action : {
                        showingSheetTask.toggle()
                        
                    }){
                    Image(systemName: "plus")
                        .font(.system(size: 28))
                        .foregroundColor(.white)
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
                            .foregroundColor(buttonIndex == 0 ? .black : .white)
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
                            .foregroundColor(buttonIndex == 1 ? .black : .white)
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
                    
              
                    
                
                    ScrollView(.vertical,showsIndicators : false){
                        VStack(spacing : 15){
                            ForEach(self.firetaskmodel.tasks){ i in
                                VStack{
                                    TaskCellView(data: i)
                                    
                                }
                                
                            }
                        }
                    }
                    .onAppear(){
                        

                        self.firetaskmodel.fetchData()
                        



                    }
                    
                
                   
                    
                
                
                
               
                
               
            }.environmentObject(firetaskmodel)
            
        }
        .background(backcolor.edgesIgnoringSafeArea(.all))
        
        
       
        
   //renews the Tasks
        
    
    
    
    
    }
    
   
}

struct TabCardView : View {
   
    @State var taskName : String = ""
    @State var taskInfo : String = ""
    @State var taskTime : Int = 0
    @State var edit2 = false
    
    @State var editButton = false
    
    
    
    var color1 = Color("Color1")
    var body: some View{
        ZStack {
            
            
           
        
            
            
            HStack {
                VStack(alignment : .leading){
                    
                    
                    Text(taskName)
                        .fontWeight(.semibold)
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
                    
                        .padding(.horizontal,15)
                }
                Button(action : {
                   
                   
                    
                    
                }
                ){
                    Image(systemName: "trash")
                        .foregroundColor(.black)
                        .padding(.trailing)
                    
                }
                
                
                
            }
           
            .frame(width : 380 ,height : 120)
            
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            
          
            
            
           
            
        }
        
        
       
        
        
    }
}

struct TaskCellView : View {
    var data  : TaskDetails
    
    var color1 = Color("Color1")
    @State var EditButton = false
    @State var show = false
    // show is for moving to edit screen
    var body: some View{
        ZStack {
            TaskDashView(data: data)
                .opacity(EditButton == false ? 0 : 1)
                            
           
            HStack {
                VStack(alignment : .leading){
                    
                    
                    Text(data.title)
                        
                        .fontWeight(.medium)
                        .foregroundColor(color1)
                        .font(.system(size: 28))
                        .padding(.top,15)
                        
                    
                    Text(data.info)
                        .font(.custom("Futura", size: 18))
                        .foregroundColor(.white)
                        .fontWeight(.light)
                        .padding(.top,1)
                        
                    
                }
                .padding(.vertical)
                .padding(.horizontal,23)
                Spacer()
                
                
                VStack {
                   
                    Text("\(Int(data.time))")
                        .foregroundColor(.white)
                        .font(.system(size: 31))
                        .fontWeight(.light)
                    
                        .padding(.horizontal,15)
                }
                Button(action : {
                    show.toggle()
                   
                   
                    
                    
                }
                ){
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding(.trailing)
                    
                }
                .fullScreenCover(isPresented: $show){
                    EditTaskView(data: self.data)
                }
                
                
                
                
            }
           
           
            .frame(width : 380 ,height : 120)
            
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.top)
            .opacity(EditButton == false ? 1 : 0)
            .onLongPressGesture {
                EditButton.toggle()
            }
            
          
            
            
           
            
        }
       
    }
}

// opens new sheet(Edit task Sheet) and successfully delete the item in firestore
//struct EditTaskView : View {
//    var dbTasks = Firestore.firestore().collection("Tasks")
//    var data : TaskDetails
//    @Environment(\.presentationMode) var prentationMode
//    @State var newShow = false
//    //for going back to the main view
//    var body: some View{
//        VStack{
//            Text(data.title)
//                .foregroundColor(.black)
//                .font(.system(size: 25))
//                .fontWeight(.semibold)
//                .padding()
//            Text(data.info)
//            Button(action : {
//                let Id = data.docID
//                dbTasks.document(Id).delete()
//                newShow.toggle()
//
//
//            }){
//                Image(systemName: "trash")
//            }
//            .fullScreenCover(isPresented: $newShow){
//                MainView()
//            }
//
//            Spacer()
//        }
//
//
//    }
//}
//
