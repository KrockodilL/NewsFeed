//
//  String+RealmFilter.swift
//  NewsFeed
//
//  Created by o.sinev on 17.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import Foundation

extension String {

    var realmFilterFromId: String {
        return "id == '\(self)'"
    }

}
