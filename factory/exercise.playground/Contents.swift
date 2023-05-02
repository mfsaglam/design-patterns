import Foundation

class Person {
  var id: Int
  var name: String

  init(called name: String, withId id: Int) {
    self.name = name
    self.id = id
  }
}

class PersonFactory {
    static var count = 0
    
    func createPerson(name: String) -> Person {
        let person = Person(called: name, withId: PersonFactory.count)
        PersonFactory.count += 1
        return person
    }
}

func main() {
    let factory = PersonFactory()
    let person1 = factory.createPerson(name: "Alice")
    let person2 = factory.createPerson(name: "Bob")

    print(person1.id)
    print(person2.id)
}

main()
