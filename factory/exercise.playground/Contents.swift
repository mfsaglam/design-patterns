import Foundation
import XCTest

class Person {
  var id: Int
  var name: String

  init(called name: String, withId id: Int) {
    self.name = name
    self.id = id
  }
}

class PersonFactory {
  func createPerson(name: String) -> Person {
    return Person(called: name, withId: 1)
  }
}
