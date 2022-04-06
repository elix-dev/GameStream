//
//  Home.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 5/04/22.
//

import SwiftUI
import AVKit

struct HomeView: View {
    
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
            
        }//color iconos
        .accentColor(.white)
    }
    
    //UIKit
   /* init(){
        UITabBar.appearance().barTintColor =
        UIColor(Color("TabBar-Color"))
        UITabBar.appearance().isTranslucent = true
        
        print("Iniciando las vistas de home")
    }*/
    
    
    
    
    
    
    
    
    init(){
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .gray
            UITabBar.appearance().standardAppearance = appearance
            if#available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
                
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
                        Button(action: busqueda, label: {
                            Image(systemName:"magnifyingglass")
                                .foregroundColor(textoBusqueda.isEmpty ?
                                Color(.yellow) : Color("DarkCian")
                        )
                    })
                        //logica barra de busqueda
                        ZStack(alignment:.leading) {
                            
                            if textoBusqueda.isEmpty {
                                Text("Buscar un video")
                                    .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                                TextField("", text: $textoBusqueda)
                                    .foregroundColor(.white)
                            }
                        }
                    }.padding([.top, .leading, .bottom], 11.0)
                        .background(Color("blue-gray"))
                        .clipShape(Capsule())
                   
                }.padding(.horizontal,18.0)
            
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
          
    }
        
}
    func busqueda() {
        print("El usuario esta buscando \(textoBusqueda)")
    }
   
}
   
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .preferredColorScheme(.dark)
    }
}
}

