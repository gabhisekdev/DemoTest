//
//  PlaceCellDataModel.swift
//  NearbyDemoTest
//
//  Created by Abhisek on 6/10/18.
//  Copyright © 2018 Abhisek. All rights reserved.
//

import Foundation

struct PlaceCellDataModel: Equatable {
    var name: String
    var address: String
    var rating: String
    var openStatusText: String
    
    init(place: Place) {
        name = place.name ?? ""
        address = place.address ?? ""
        rating = place.rating?.description ?? "0.0"
        guard let isOpen = place.openStatus else {
            openStatusText = "Sorry we are closed."
            return
        }
        openStatusText = isOpen ? "We are open. Hop in now!!" : "Sorry we are closed."
    }
}
