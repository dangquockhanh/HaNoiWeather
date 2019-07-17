//
//  DataService.swift
//  HaNoiWeather
//
//  Created by Đặng Khánh  on 7/17/19.
//  Copyright © 2019 Đặng Khánh. All rights reserved.
//

import UIKit

class DataService {
    
    static let sharedIntance: DataService = DataService()
    
    func getWeather(completedHandle: @escaping(HNWeather) -> Void) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast/daily?lat=21.028511&lon=105.804817&cnt=10&mode=json&appid=c80a2e47667cedab4873abb8a9fff762") else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let downloadTask = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            do {
                let recievedWeather = try JSONDecoder().decode(HNWeather.self, from: data!)
                DispatchQueue.main.async {
                    completedHandle(recievedWeather.self)
                }
            } catch {
                fatalError(error as! String)
            }
        })
        downloadTask.resume()
    }
    
}
