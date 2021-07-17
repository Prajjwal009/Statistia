//
//  TaskDashView.swift
//  Statistia
//
//  Created by Prajjwal on 16/07/21.
//

import SwiftUI

struct TaskDashView: View {
    @State var color1 = Color("Color1")
    var body: some View {
        VStack(spacing : 10){
            Button(action : {
                
            }){
            Text("start")
                .foregroundColor(color1)
                .font(.system(size: 30))
                .fontWeight(.semibold)
               
            }
            Rectangle()
                .frame(width : 200 ,height : 1)
                
            
            Button(action : {
                
            }){
            Text("edit")
                .foregroundColor(color1)
                .font(.system(size: 30))
                .fontWeight(.semibold)
            }
            Rectangle()
                .frame(width : 200 ,height : 1)
            Button(action : {
                
            }){
            Text("delete")
                .foregroundColor(color1)
                .font(.system(size: 30))
                .fontWeight(.semibold)
            }
           
            
            
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(20)
    }
    
    struct TaskDashView_Previews: PreviewProvider {
        static var previews: some View {
            TaskDashView()
        }
    }
}
