//
//  DateFormatterProtocol.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

protocol DateConverterProtocol {
    /**
     Получение короткой записи даты и времени
     - Parameter string: Строка вида 2019-04-11T07:00:00Z
     - Returns: Дата 24 авг, 15:00
     - Authors: Oleg Sinev
     */
    func getShortDateAndTime(fromString string: String?) -> String?
}
