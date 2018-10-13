## The problem

There are times when you just want to create a struct or a class instance in Swift without caring about it's contents. However, due to the fact that Swift is type safe and because of the way that Swift initializers work, this can be very tedious. You may have to provide a value for every initializer parameter without a default value. And if you are not lucky enough, these parameters are not expressible by literals, and you have to create them as well and their dependencies and their dependencies' dependencies... and so on.. the whole dependency sub-graph.

One common use case is when unit testing.

```swift
    func testCanNotiyPersonInNY() {
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
```

Here we only care about the person's coordinates and email because these are the things that really affect the `canNotify` method but we have to provide dummy values for the rest of the initializer's parameters. And in this case we are lucky enough that the dependency tree isn't deeper and that we don't have twice the parameters in the initializers.

## Code generation to the rescue! ✊

Using [AutoMake](AutoMake.swifttemplate), which is a [Sourcery](https://github.com/krzysztofzablocki/Sourcery) template we can reduce the boilerplate at the call site to this:

```swift
    func testCanNotiyPersonInNYWithAutoMake() {
        let sut = Notifier()
        let personWhoLivesInNY = Person.make(address: .make(city: "New York"))
        XCTAssertTrue(sut.canNotify(personWhoLivesInNY))
    }
```

## Installation

1. [Install Sourcey](https://github.com/krzysztofzablocki/Sourcery#installation)
2. Include AutoMake.swifttemplate in your repo.
3. Include [DefaultValue.swift](DefaultValue.swift) in the target you want to use the generated factories in (for example - the test target). This provides default values for the most common Swift types. These default values are used as default parameters for the static factory function the `AutoMake` template generates.

## Usage

1. Make the type you want to generate a factory for and make it conform to the `AutoMake` protocol. e.g. `extension Person: AutoMake {}` and `extension Address: AutoMake {}` in the test target (in the case you want to use the generated factories just for your tests, it's best practice to not to 'pollute' your production code).
2. [Run Sourcery](https://github.com/krzysztofzablocki/Sourcery#usage) and you get your factories as static `make` functions. Depending on how you use `Sourcery` you can put the generated code in a generated single file, in generated separate files (one for each type conforming to `AutoMake`) or inline in an existing file. For details see [here](https://cdn.rawgit.com/krzysztofzablocki/Sourcery/master/docs/writing-templates.html)

## Example Project
You can check out the [Example project](Example) to play around with the AutoMake template. The test target is set up so that each time you run the tests (CMD+U) the `AutoMake` template generates factories and puts them inline in the [AutoMake.swift](Example/ExampleTests/AutoMake.swift) file of the ExampleTests target. In order to do so, the [AutoMake.swifttemplate](Example/AutoMake.swifttemplate) is slightly modified to use the inline mode and the corresponding annotations are being used in the [AutoMake.swift](Example/ExampleTests/AutoMake.swift) file.