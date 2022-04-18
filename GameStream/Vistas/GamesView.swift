//
//  GamesView.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 11/04/22.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    @State var gameviewIsActive: Bool = false
    @State var url:String = ""
    @State var titulo:String = ""
    @State var studio:String = ""
    @State var calificacion:String = ""
    @State var añoPublicacion:String = ""
    @State var descripcion:String = ""
    @State var tags:[String] = [""]
    @State var imgsUrl:[String] = [""]
    
    let formaGrid = [
    
        GridItem(.flexible()),
        GridItem(.flexible())
        
    
    ]
    
    
    
    
    var body: some View {

        
        ZStack {
            
            Color ("Marine")
                .ignoresSafeArea()
            
            VStack{
                
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0,
                                        bottom: 64, trailing: 0))
                
                
                ScrollView {
                    
                    LazyVGrid(columns:formaGrid, spacing: 8) {
                        
                        ForEach (todosLosVideojuegos.gamesInfo, id: \.self){
                            
                            juego in 
                            
                            Button(action: {
                                
                                url = juego.videosUrls.mobile
                                
                                
                                
                            }, label: Text("Button"))
                            
                        }
                        
                        
                    }
                    
                }
                
                
            }.padding(.horizontal,6)
                
                
                
            
                
            
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
        
        
        
        
        
            
                perform: {
                    print("primer elemento del json: \(todosLosVideojuegos.gamesInfo[0])")
                    print("Titulo del primer videojuego del json \(todosLosVideojuegos.gamesInfo[2].contentRaiting)")
                    
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
