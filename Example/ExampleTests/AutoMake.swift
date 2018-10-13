//
//  AutoMake.swift
//  ExampleTests
//
//  Created by Kostas Kremizas on 14/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import Foundation
import CoreLocation
@testable import Example

extension Address: AutoMake {}
// sourcery:inline:Address.AutoMake
extension Address {
    static func make(city: String = String.defaultValue, 
                     country: String = String.defaultValue, 
                     street: String = String.defaultValue, 
                     number: String = String.defaultValue, 
                     postCode: String = String.defaultValue, 
                     floor: Int = Int.defaultValue, 
                     coords: CLLocationCoordinate2D = CLLocationCoordinate2D.defaultValue) -> Address {
        return Address(city: city, 
                       country: country, 
                       street: street, 
                       number: number, 
                       postCode: postCode, 
                       floor: floor, 
                       coords: coords)
    }
}

extension Address {
    static var defaultValue: Address { return Address.make() }
}

// sourcery:end

extension Person: AutoMake {}
// sourcery:inline:Person.AutoMake
extension Person {
    static func make(firstName: String = String.defaultValue, 
                     lastName: String = String.defaultValue, 
                     middleName: String? = String?.defaultValue, 
                     phoneNumbers: [Int] = [Int].defaultValue, 
                     govID: String = String.defaultValue, 
                     passportNumber: String = String.defaultValue, 
                     address: Address = Address.defaultValue, 
                     email: String? = String?.defaultValue) -> Person {
        return Person(firstName: firstName, 
                      lastName: lastName, 
                      middleName: middleName, 
                      phoneNumbers: phoneNumbers, 
                      govID: govID, 
                      passportNumber: passportNumber, 
                      address: address, 
                      email: email)
    }
}

extension Person {
    static var defaultValue: Person { return Person.make() }
}

// sourcery:end

extension CLLocationCoordinate2D: AutoMake {}

// sourcery:inline:CLLocationCoordinate2D.AutoMake
extension CLLocationCoordinate2D {
    static func make() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D()
    }
}

extension CLLocationCoordinate2D {
    static var defaultValue: CLLocationCoordinate2D { return CLLocationCoordinate2D.make() }
}
// sourcery:end
