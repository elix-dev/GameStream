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
                       
                        HStack {//imagen lupa
                            Button(action: busqueda, label: {
                                Image(systemName:"magnifyingglass")
                                    .foregroundColor(textoBusqueda.isEmpty ?//<- si la caja esta vacia de color va a ser
                                                     Color(.yellow) : Color("DarkCian")
                                    )
                            })
                            
                            //logica barra de busqueda
                            ZStack(alignment:.leading) {
                                
                                if textoBusqueda.isEmpty {
                                    Text("Buscar un video")
                                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0))
                                }
                                TextField("", text: $textoBusqueda)
                                    .foregroundColor(.white)
                            }
                        }.padding([.top, .leading, .bottom], 11.0)
                            .background(Color("blue-gray"))
                            .clipShape(Capsule())
                        
                        
                        
                        ScrollView(showsIndicators: false){
                                       SubModuloHome()
                                           
                                       }//.clipped()
                        
                                       
                        
                    }.padding(.horizontal,18.0)
                    
                }.navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                
            }
            
            
        }//logica barra de busqueda
        func busqueda() {
            print("El usuario esta buscando \(textoBusqueda)")
        }
        
    }
    
        
    
    struct SubModuloHome:View {
        
        @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
        
        var body: some View {
            
            VStack{
                Text("LOS MÁS POPULARES")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                ZStack {
                    
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }, label: {
                        
                        VStack (spacing: 0){
                            
                            Image("13-swiftuiapps-2105-rectangle7").resizable().scaledToFill()
                            Text("theWicher")
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .background(Color("blue-gray"))
                        }
                    })
                    //imagen de play
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 42, height: 42)
                    
                    
                }
            }
            
            
            NavigationLink(
                destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!))
                .frame(width: 400, height: 300),
                isActive: $isPlayerActive,
                label: {
                    EmptyView()
                }
        )
    }
    
    
    struct Home_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
                .preferredColorScheme(.dark)
        }
    }
}


}

