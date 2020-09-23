//
//  DateFormatter.swift
//  NewsFeed
//
//  Created by o.sinev on 20.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

final class DateConverter: DateConverterProtocol {

    // MARK: - Properties
    private let locale = Locale(identifier: "ru")

    // MARK: - Computed Properties
    private lazy var dateFormatter = DateFormatter().with {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        $0.locale = locale
    }

    private lazy var dateFormatterWithoutTimezone = DateFormatter().with {
        $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        $0.locale = locale
    }

    // MARK: - Public methods
    func date(from string: String?) -> Date? {
        guard var string = string else {
            return nil
        }
        /** Отбрасываем часовой пояс из входной строки с датой.
         Если на входе строка 2020-09-24T19:00:00+07:00, то на выходе dateFormatter.date(from: string)
         получаем 2020-09-24 12:00:00 +0000 (UTC, а нужно получить local time)
         */
        if let range = string.range(of: "+")?.lowerBound {
            string = String(string.prefix(upTo: range))
        }

        return [dateFormatter.date(from: string),
                dateFormatterWithoutTimezone.date(from: string)]
            .compactMap { $0 }.first
    }

    func getTime(fromString string: String?) -> String? {
        return dateComponent(from: string, inFormat: "HH:mm")
    }

    func getShortDate(fromString string: String?) -> String? {
        return dateComponent(from: string, inFormat: "dd MMM")
    }

    func getShortDateAndTime(fromString string: String?) -> String? {
        guard
            let date = getShortDate(fromString: string),
            let time = getTime(fromString: string) else {
            return nil
        }
        return date + ", " + time
    }

    // MARK: - Private methods
    private func dateComponent(from sourceString: String?, inFormat format: String) -> String? {
        guard let date = date(from: sourceString) else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = locale
        return formatter.string(from: date)
    }

}
