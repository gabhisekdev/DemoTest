//
//  PlaceListViewModel.swift
//  DemoTests
//
//  Created by Abhisek on 6/9/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation

class PlaceListViewModel {
    
    var dataFetcher: PlaceDataFetcherProtocol!
    
    // Output
    var displayError:(String)->() = { _ in }
    var numberOfRows = 0
    var title = ""
    
    // Input
    var viewDidLoad: () -> () = { }
    
    private var tableDataSource = [PlaceCellDataModel]()
    private var dataModel: [Place]! {
        didSet {
            configureTableDataSource()
            configureOutput()
        }
    }
    
    init(dataFetcher: PlaceDataFetcherProtocol) {
        self.dataFetcher = dataFetcher
        viewDidLoad = { [weak self] in
            self?.getPlacesData()
        }
    }
    
    private func getPlacesData() {
        dataFetcher.fetchPlaces { [weak self] (placeList, errorMessage) in
            guard let places = placeList else {
                self?.displayError(errorMessage!)
                return
            }
            self?.dataModel = places
        }
    }
    
    private func configureTableDataSource() {
        for place in dataModel {
            tableDataSource.append(PlaceCellDataModel(place: place))
        }
    }
    
    private func configureOutput() {
        title = "Place List"
        numberOfRows = tableDataSource.count
    }
    
    func tableCellDataModelForIndexPath(_ indexPath: IndexPath) -> PlaceCellDataModel {
        return tableDataSource[indexPath.row]
    }
    
}
