//
//  String+Extension.swift
//  Weather
//
//  Created by Shafeer Puthalan on 22.03.23.
//

import Foundation
extension String {
    func toDateFromTimeZone(format: String = "MMM d, h:mm a") -> String {
        let date = Date()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = format
        dateFormater.timeZone = TimeZone(abbreviation: self)
        return dateFormater.string(from: date)
    }
}
