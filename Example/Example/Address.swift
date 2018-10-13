//
//  Address.swift
//  Example
//
//  Created by Kostas Kremizas on 14/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import Foundation
import CoreLocation

struct Address {
    let city: String
    let country: String
    let street: String
    let number: String
    let postCode: String
    let floor: Int
    let coords: CLLocationCoordinate2D
}
