//
//  NetworkManager.swift
//  TestRickAndMortyAlamofire
//
//  Created by Александр Бехтер on 29.07.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import Alamofire

class NetworkManager {
    var persons:[Result] = []
    static let shared = NetworkManager()
    
    func fetchDataAlamofire(from urlSring: String, with complition: @escaping(Character) -> Void) {
        AF.request(urlSring)
            .validate()
            .responseDecodable(of: Character.self) { data in

                switch data.result {
                case .success(let character):
                    complition(character)
                case .failure(let error):
                    print(error)
                }

        }
    }
}
