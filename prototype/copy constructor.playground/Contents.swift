import Foundation

class Adress: CustomStringConvertible {
    var streetAddress: String
    var city: String
    
    init(streetAddress: String, city: String) {
        self.streetAddress = streetAddress
        self.city = city
    }
    
    var description: String {
        "\(streetAddress), \(city)"
    }
}

class Employee: CustomStringConvertible {
    var name: String
    var address: Adress
    
    init(_ name: String, _ address: Adress) {
        self.name = name
        self.address = address
    }
    
    var description: String {
        "My name is \(name) and I live at \(address)"
    }
}

func main() {
    var john = Employee("John", Adress(streetAddress: "123 London Road", city: "London"))
    print(john)
}

main()
