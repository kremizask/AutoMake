//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Kostas Kremizas on 14/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import XCTest
@testable import Example
import CoreLocation

class NotifierTests: XCTestCase {

    func testCanNotiyPersonInNYWithoutAutoMake() {
        let sut = Notifier()
        let address = Address(city: "New York",
                              country: "",
                              street: "",
                              number: "",
                              postCode: "",
                              floor: 0,
                              coords: CLLocationCoordinate2D())
        
        let personWhoLivesInNY = Person(firstName: "",
                                        lastName: "",
                                        middleName: nil,
                                        phoneNumbers: [],
                                        govID: "",
                                        passportNumber: "",
                                        address: address,
                                        email: nil)
        
        XCTAssertTrue(sut.canNotify(personWhoLivesInNY))
    }
    
    func testCanNotiyPersonInNYWithAutoMake() {
        let sut = Notifier()
        let personWhoLivesInNY = Person.make(address: .make(city: "New York"))
        XCTAssertTrue(sut.canNotify(personWhoLivesInNY))
    }
}
