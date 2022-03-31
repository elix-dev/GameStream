//
//  ContentView.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 28/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Spacer()
            Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                .ignoresSafeArea()
            VStack {
                Image("logo2")
                Image("logo").padding(.bottom, 42)//.resizable().aspectRatio(contentMode: .fit).frame(width: 250)
    
                InicioYRegistroView()
                
            }
        }
    }
}

struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        
        VStack {
            HStack{
                
                Spacer()
                Button("INICIA SESIÓN"){
                    tipoInicioSesion = true
                    //print("pantalla inicio sesión")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button("REGISTRATE"){
                    tipoInicioSesion = false
                    //print("pantalla de registro")
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
            }
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                InicioSesionView()
            }else{
                RegistroView()
            }

        }
    }
    
}



struct InicioSesionView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
    }
    
    
    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                Text("Correo Electronico").foregroundColor(Color("DarkCian"))
                ZStack(alignment:.leading){
                    
                    if correo.isEmpty{
                        Text("escribe tu correo").font(.caption)
                            .foregroundColor(.gray)
                    }
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("DarkCian")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                ZStack(alignment:.leading){
                    
                    if contraseña.isEmpty{
                        Text("escribe tu contraseña").font(.caption)
                            .foregroundColor(.gray)
                    }
                    SecureField("", text: $contraseña).foregroundColor(.white)
                }
                
                Divider().frame(height: 1).background(Color("DarkCian")).padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?").font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("DarkCian")).padding(.bottom)
                
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN").font
                })
                
                
                
                
            }.padding(.horizontal, 77.0)
        }
    }
}


struct RegistroView:View {
    var body: some View {
        
        Text("Soy la vista inicio de sesion")
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        Image("pantalla1")
            .resizable()
        
        ContentView()
            .preferredColorScheme(.dark)
        
        
    }
}
