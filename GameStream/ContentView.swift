//
//  ContentView.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 28/03/22.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                Spacer()
                Color(red: 19/255, green: 30/255, blue: 53/255, opacity: 1.0)
                    .ignoresSafeArea()
                VStack {
                    
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                        .padding()
                    
                    InicioYRegistroView()
                    
                }
            }.navigationBarHidden(true)
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

// INICIO DE SESION
struct InicioSesionView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var isPantallaHomeActive = false
 
    // @State var inicioSesionFacebook = ""
    //@State var inicioSesionTwitter = ""
    

    
    func inicioSesionFacebook() {
        print("Estoy iniciando sesion con facebook")
    }
    
    func  inicioSesionTwitter() {
        print("Estoy iniciando sesion con twitter")
    }

    var body: some View {
        
        ScrollView {
            VStack(alignment:.leading){
                
                Text("Correo Electronico").foregroundColor(Color("DarkCian"))
                ZStack(alignment:.leading){
                    
                    if correo.isEmpty{
                        Text("ejemplo@gmail.com").font(.caption)
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
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote).frame(width: 300, alignment: .trailing)
                    .foregroundColor(Color("DarkCian"))
                    .padding(.bottom)
                
                
                Button(action: iniciarSesion, label: {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 5.0)
                            .stroke(Color("DarkCian"),lineWidth: 1)
                            .shadow(color: .white, radius: 5))
                })
                .padding(.vertical, 40)
                
                Text("Inicia sesion con redes sociales")
                    .foregroundColor(.white)
                    .padding(.top, 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack {
                    
                    Button(action: {print("Inicio de sesion con Facebook")}) {
                        Text("Facebook").foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.vertical, 3.0)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }
                    .padding()
                    
                    Button(action: {print("Inicio de sesion con Twitter")}) {
                        Text("Twitter").foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.vertical, 3.0)
                            .foregroundColor(.white)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("blue-gray")
                                .clipShape(RoundedRectangle(cornerRadius: 4.0)))
                        
                    }
                    
                }

            }.padding(.horizontal, 77.0)
            
            NavigationLink(
              destination: HomeView(),
              isActive: $isPantallaHomeActive,
              label: {
                EmptyView()
            })
            
        }
    }
    
    
    
    func iniciarSesion() {
        print("Estoy iniciando sesion")
        isPantallaHomeActive = true
    }
}

//REGISTRO
struct RegistroView:View {
    
    @State var correo = ""
    @State var contraseña = ""
    @State var confirmarContraseña = ""
    
    func tomarFoto() {
        print("voy a tomar una foto")
    }
    
    func registrate() {
        print("me estoy resgistrando")
    }
    
    func inicioSesionFacebook() {
        print("Estoy iniciando sesion con facebook")
    }
    
    func  inicioSesionTwitter() {
        print("Estoy iniciando sesion con twitter")
    }
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment:.center) {
                
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puede cambiar o elegirla mas adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: tomarFoto, label: {
                    
                    ZStack{
                        Image("30-swiftui-apps-ios-profile-pic")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                    
                }).padding(.bottom)
                VStack(alignment:.leading){
                    VStack(alignment:.leading){
                        Text("Correo Electronico*").foregroundColor(Color("DarkCian"))
                            .frame(width: 300, alignment: .leading)
                        ZStack(alignment:.leading){
                            if correo.isEmpty{
                                Text("ejemplo@gmail.com").font(.caption)
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
                        Text("Confirmar contraseña*").foregroundColor(.white)
                        ZStack(alignment:.leading){
                            
                            if contraseña.isEmpty{
                                Text("escribe tu contraseña").font(.caption)
                                    .foregroundColor(.gray)
                            }
                            SecureField("", text: $contraseña).foregroundColor(.white)
                        }
                        
                        Divider().frame(height: 1).background(Color("DarkCian")).padding(.bottom)
                    }
                    
                    Button(action: registrate, label: {
                        Text("REGÍSTRATE")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .overlay(RoundedRectangle(cornerRadius: 5.0)
                                .stroke(Color("DarkCian"),lineWidth: 1)
                                .shadow(color: .white, radius: 5))
                    })
                    .padding(.vertical, 40)
                    
                    Text("Inicia sesion con redes sociales")
                        .foregroundColor(.white)
                        .padding(.top, 20)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        
                        Button(action: {print("Inicio de sesion con Facebook")}) {
                            Text("Facebook").foregroundColor(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.vertical, 3.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("blue-gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }
                        .padding()
                        
                        Button(action: {print("Inicio de sesion con Facebook")}) {
                            Text("Twitter").foregroundColor(.white)
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.vertical, 3.0)
                                .foregroundColor(.white)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("blue-gray")
                                    .clipShape(RoundedRectangle(cornerRadius: 4.0)))
                            
                        }
                        
                    }
                    
                }.padding(.horizontal, 77.0)
            }
            
            Text("Soy la vista registro")
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
}


