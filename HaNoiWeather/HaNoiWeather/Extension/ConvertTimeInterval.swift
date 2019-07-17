//
//  ConvertTimeInterval.swift
//  HaNoiWeather
//
//  Created by Đặng Khánh  on 7/17/19.
//  Copyright © 2019 Đặng Khánh. All rights reserved.
//

import Foundation

extension TimeInterval {
    func getDaysOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "vi_VN")
        
        let dayOfWeek = Date(timeIntervalSince1970: self)
        
        return dateFormatter.string(from: dayOfWeek)
    }
    
    func convertTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        dateFormatter.locale = Locale(identifier: "vi_VN")
        
        let dateOfTime = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: dateOfTime)
    }
}
