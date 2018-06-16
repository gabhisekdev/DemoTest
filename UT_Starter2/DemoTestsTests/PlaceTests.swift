//
//  PlaceTests.swift
//  DemoTestsTests
//
//  Created by Abhisek on 6/16/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
