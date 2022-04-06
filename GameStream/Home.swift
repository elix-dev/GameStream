//
//  Home.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 5/04/22.
//

import SwiftUI
import UIKit

struct Home: View {
    
    @State var tabSeleccionado:Int = 2
    
    var body: some View {
        
        TabView (selection:$tabSeleccionado){

            Text("Home")
                    .tabItem {
                        Image(systemName: "person")
                        Text("Perfil")
                    }.tag(0)
            
            Text("Pantalla juegos")
                    .tabItem {
                        Image(systemName: "gamecontroller")
                        Text("Juegos")
                    }.tag(1)
            
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Pantalla Favoritos")
                    .tabItem {
                        Image(systemName: "heart")
                        Text("Favoritos")
                    }.tag(3)
            
        }
        .accentColor(.white)
    }
    
    //UIKit
    init(){
        UITabBar.appearance().barTintColor =
        UIColor(Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
    }
}


struct PantallaHome: View {
    
    @State var textoBusqueda = ""
    
    var body: some View {
        ZStack {
            Color("Marine").ignoresSafeArea()
            
            VStack {
                VStack {
                    Image("logo2")
                    Image("logo").padding(.horizontal, 11.0)
                    
                    HStack {
                        Button(action: {/*Metodo de busqueda*/}, label: {
                            Image(systemName:"magnifyingglass")
                                .foregroundColor(textoBusqueda.isEmpty ?
                                Color(.yellow) : Color("DarkCian")
                        )
                    })
                    }
                   
            }.padding(.horizontal,18)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}




struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
}
