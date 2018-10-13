//
//  Address.swift
//  Example
//
//  Created by Kostas Kremizas on 13/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import Foundation

class Person {
    let firstName: String
    let lastName: String
    let middleName: String?
    let phoneNumbers: [Int]
    let govID: String
    let passportNumber: String
    let address: Address
    let email: String?
    
    // For generating these designated initializers for classes you can use other
    // tools like https://github.com/Bouke/SwiftInitializerGenerator or you can
    // easily modify the AutoMake.swifttemplate to fit your needs.
    public init(firstName: String,
                lastName: String,
                middleName: String?,
                phoneNumbers: [Int],
                govID: String,
                passportNumber: String,
                address: Address,
                email: String?) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.phoneNumbers = phoneNumbers
        self.govID = govID
        self.passportNumber = passportNumber
        self.address = address
        self.email = email
    }    
}
