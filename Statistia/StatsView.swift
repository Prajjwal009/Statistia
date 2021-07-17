//
//  StatsView.swift
//  Statistia
//
//  Created by Prajjwal on 16/07/21.
//

import SwiftUI

struct StatsView: View {
    @State var color1 = Color("Color1")
    @State var showingFirstView = false
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Text("Stats")
                        .foregroundColor(.black)
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .padding()
                    Spacer()
                    Button(action : {
                        showingFirstView.toggle()
                        
                    }){
                        Image(systemName: "chevron.backward")
                            
                            .foregroundColor(color1)
                            .font(.system(size: 23))
                            .padding()
                    }
                    .fullScreenCover(isPresented: $showingFirstView, content: ContentView.init)
                }
                Spacer()
            }
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
