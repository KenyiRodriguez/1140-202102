//
//  DateManager.swift
//  Peliculas
//
//  Created by Kenyi Rodriguez on 8/11/21.
//

import Foundation

extension Date {
    
    var toString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd 'de' MMMM 'del' yyyy"
        dateFormatter.locale = Locale(identifier: "es_pe")
        return dateFormatter.string(from: self)
    }
}

extension String {
    
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }
}
