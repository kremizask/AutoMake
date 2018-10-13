//
//  Notifier.swift
//  Example
//
//  Created by Kostas Kremizas on 14/10/2018.
//  Copyright © 2018 kremizas. All rights reserved.
//

import Foundation

struct Notifier {
    func canNotify(_ person: Person) -> Bool {
        let emailIsEmptyOrNil = person.email?.isEmpty ?? true
        return !emailIsEmptyOrNil || person.address.city == "New York"
    }
}
