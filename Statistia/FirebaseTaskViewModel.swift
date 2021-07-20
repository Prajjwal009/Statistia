//
//  FirebaseTaskViewModel.swift
//  Statistia
//
//  Created by Prajjwal on 14/07/21.
//

import SwiftUI

import FirebaseFirestore
struct TaskTapped : Identifiable{
    var id = UUID().uuidString
    
    var title : String
    var docID : String
}

struct TaskDetails : Identifiable, Hashable {
    var id  = UUID().uuidString
    var title : String
    var info : String
    var time : Double
    var docID : String
    
    
    
    
}


class FirebaseTaskModel : ObservableObject{
    @Published var tasks : [TaskDetails] = [
    ]
    @Published var x : [TaskTapped] = []
    
    
    private var db = Firestore.firestore().collection("Tasks")
    
    func fetchData(){
        
        
        
        db.getDocuments {(snapshot, err) in
            if let err =  err {
                print(err)
                return
            }
            else{
            for document in snapshot!.documents {
                let documentID = document.documentID as! String
                let title = document.get("title") as! String
                let time = document.get("time") as! Int
                let info = document.get("info") as! String
                
                
                
                self.tasks.append(TaskDetails(title: title,info : info, time: Double(time), docID: documentID))
                //
            }
                
                
                
            }
        }
        
        
        
        //     
        
    }
    
    
    
    
    
}
