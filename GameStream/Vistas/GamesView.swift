//
//  GamesView.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 11/04/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Hola desde pantalla GamesView ")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
            
                perform: {
                    print("primer elemento del json")
                    print("Titulo del primer videojuego del json")
                    
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
