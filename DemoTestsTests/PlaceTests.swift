//
//  PlaceTests.swift
//  DemoTestTests
//
//  Created by Abhisek on 6/9/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import XCTest
@testable import DemoTest

class PlaceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // Test all attributes that should be present in Place model.
    func testAttributes() {
        let attributes: [String : Any] = ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 4.8, "opening_hours": ["open_now": false]]
        let place = Place(attributes: attributes)
        XCTAssertEqual(place.name, "Cafe De Latina")
        XCTAssertEqual(place.address, "Bengaluru")
        XCTAssertEqual(place.rating, 4.8)
        XCTAssertEqual(place.openStatus, false)
    }
    
}
