//
//  NewsFeedTests.swift
//  NewsFeedTests
//
//  Created by o.sinev on 21.09.2020.
//  Copyright © 2020 o.sinev. All rights reserved.
//

import XCTest
import Foundation

class NewsFeedTests: XCTestCase {

    private let dateConverter = DateConverter()

    func testGettingValidShortDateAndTime() {
        let inputTimestamp = "2020-02-02T02:02:02+03"
        let expectedValue = "02 февр., 02:02"

        let result = dateConverter.getShortDateAndTime(fromString: inputTimestamp)

        XCTAssert(expectedValue == result)
    }


}
