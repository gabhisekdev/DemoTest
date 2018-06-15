//
//  PlaceListViewModelTests.swift
//  DemoTestTests
//
//  Created by Abhisek on 6/9/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import XCTest
@testable import DemoTests

class PlaceListViewModelTests: XCTestCase {
    
    var sut: PlaceListViewModel!
    var mockPlaceDataFetcher: MockPlaceDataFetcher!
    
    override func setUp() {
        super.setUp()
        sut = PlaceListViewModel(dataFetcher: MockPlaceDataFetcher())
        mockPlaceDataFetcher = MockPlaceDataFetcher()
        sut.viewDidLoad()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
        mockPlaceDataFetcher = nil
    }
  
    func testOutputAttributes() {
        XCTAssertEqual(sut.numberOfRows, mockPlaceDataFetcher.tabeDataModel.count)
        XCTAssertEqual(sut.title, "Place List")
    }
    
    func testDataModelForIndexPath() {
        let indexPath = IndexPath(row: 0, section: 0)
        XCTAssertEqual(mockPlaceDataFetcher.tabeDataModel[0], sut.tableCellDataModelForIndexPath(indexPath))
    }
    
}

// MARK: MockPlaceDataFetcher
/// A mock for data fetcher to provide test data.
class MockPlaceDataFetcher: PlaceDataFetcherProtocol {
    
    var places = [Place]()
    var tabeDataModel = [PlaceCellDataModel]()
    
    init() {
        let firstPlace = Place(attributes: ["name": "Cafe De Latina", "vicinity": "Bengaluru", "rating": 3.0, "opening_hours": ["open_now": false]])
        places.append(firstPlace)
        tabeDataModel.append(PlaceCellDataModel(place: firstPlace))
        let secondPlace = Place(attributes: ["name": "Hotel Taj", "vicinity": "Mumbai", "rating": 4.8, "opening_hours": ["open_now": true]])
        tabeDataModel.append(PlaceCellDataModel(place: secondPlace))
        places.append(secondPlace)
    }
    
    func fetchPlaces(completion: ([Place]?,_ errorMessage: String?)->()) {
        completion(places, nil)
    }
    
}
