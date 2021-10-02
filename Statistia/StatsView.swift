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
    @State var backcolorForStats = LinearGradient(gradient: Gradient(colors: [Color.green, Color.black]), startPoint: .topTrailing, endPoint: .center)
    var body: some View {
        ZStack{
            VStack{
                HStack {
                    Text("Stats")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.system(size: 35))
                        .padding()
                    Spacer()
                    Button(action : {
                        showingFirstView.toggle()
                        
                    }){
                        Image(systemName: "chevron.backward")
                            
                            .foregroundColor(.white)
                            .font(.system(size: 23))
                            .padding()
                    }
                    .fullScreenCover(isPresented: $showingFirstView, content: ContentView.init)
                }
                Spacer()
            }
        }.background(backcolorForStats.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/))
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
