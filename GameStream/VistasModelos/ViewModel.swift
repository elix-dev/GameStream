//
//  ViewModel.swift
//  GameStream
//
//  Created by Elias Jose Rodriguez Indaburo on 11/04/22.
//

import Foundation



class ViewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init() {
        let url = URL (string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: <#T##URLRequest#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
    
}
