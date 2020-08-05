//
//  ImageView.swift
//  TestRickAndMortyAlamofire
//
//  Created by Александр Бехтер on 31.07.2020.
//  Copyright © 2020 Александр Бехтер. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    
    public func fetchImage(from url: String) {
        guard let url = URL(string: url) else {
            image = #imageLiteral(resourceName: "picture")
            return
            
        }
        
         func getCashedImage(url: URL) -> UIImage? {
               let urlRequest = URLRequest(url: url) // Создаем запрос
               if let cachedResponse = URLCache.shared.cachedResponse(for: urlRequest) { // Ищем ответ
                   return UIImage(data: cachedResponse.data)
               }
               return nil
           }
        
        // Если получилось получить URL , то ищем картинку по данному url адресу
        // Если изображение есть в кеше, то используем его
        
        if let cachedImage = getCashedImage(url: url) {
            image = cachedImage // Присваиваем свойству найденное изображение
            return
        }
        
        // Если изображения в кеше нет , то грузим его из сети
         
        ImageManager.shared.getImage(from: url) { (data, response) in
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
            // Сохраняем изображение в кеш
            self.saveDataToCach(with: data, and: response)
        }
    }
   
    
    // Метод для сохранения данных в кеше
    private func saveDataToCach(with data: Data, and response: URLResponse) {
        guard let urlResponse = response.url else { return }
        let cacheedResponse = CachedURLResponse(response: response, data: data)
        let urlRequest = URLRequest(url: urlResponse)
        URLCache.shared.storeCachedResponse(cacheedResponse, for: urlRequest)
    }
}
