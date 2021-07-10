//
//  SwiftUIView.swift
//  Statistia
//
//  Created by Prajjwal on 11/07/21.
//

import SwiftUI

struct TaskSetter: View {
    @State var taskText : String = ""
    var body: some View {
        VStack{
            TextField("Task Name",text:$taskText )
                .font(.system(size: 30))
                .frame(width : 380,height: 80)
                .background(Color.gray.opacity(0.2))
                .padding()
              
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TaskSetter()
    }
}
