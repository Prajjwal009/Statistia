//
//  SwiftUIView.swift
//  Statistia
//
//  Created by Prajjwal on 11/07/21.
//

import SwiftUI

struct TaskSetter: View {
    @State var taskText : String = ""
    @State var taskInfoText : String = ""
    var body: some View {
        VStack(){
            HStack(alignment: .bottom){
                TextField("Task",text: $taskText)
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
            
            TextField("About it",text : $taskInfoText)
                .padding(.horizontal)
                
                .frame(height : 60)
                .background(Color.gray.opacity(0.16))
                .cornerRadius(15)
                .padding(.top)
                .padding(.horizontal,10)
            
           
              
            Spacer()
                
              
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSetter()
    }
}
