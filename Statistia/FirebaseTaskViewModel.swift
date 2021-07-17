//
//  FirebaseTaskViewModel.swift
//  Statistia
//
//  Created by Prajjwal on 14/07/21.
//

import SwiftUI

import FirebaseFirestore

struct TaskDetails : Identifiable ,Hashable{
    var id  = UUID().uuidString
    var title : String
    var info : String
    var time : Double
    var docID : String
    
    
    
}


class FirebaseTaskModel : ObservableObject{
    @Published var tasks : [TaskDetails] = [
    ]
    
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
            
    
        
//        db.collection("Tasks").addSnapshotListener {(querySnapshot, error ) in
//            guard let documents = querySnapshot?.documents else{
//                print(error!)
//                return
//            }
//            let title =  documents.map{ $0["title"]!}
//            let time =  documents.map{ $0["time"]!}
//            for i in 0..<title.count{
//                self.tasks.append(TaskDetails(title: title[i] as! String, time: time[i] as! Double))
//            }
//
//        }
       

        }
    
    
    

}
