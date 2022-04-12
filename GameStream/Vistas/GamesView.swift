//
//  GamesView.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 11/04/22.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var todosLosVideojuegos = ViewModel()
    
    var body: some View {
        Text("Hola desde pantalla GamesView ")
            .navigationBarHidden(true)
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
