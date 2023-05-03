import Foundation

protocol Copying {
//    init(copyFrom other: Self)
    func clone() -> Self
}

class Adress: CustomStringConvertible, Copying {
    
    func clone() -> Self {
        return cloneImpl()
    }
    
    private func cloneImpl<T>() -> T {
        return Adress(streetAddress: streetAddress, city: city) as! T
    }
    
    required init(copyFrom other: Adress) {
        streetAddress = other.streetAddress
        city = other.city
    }
    
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

struct Employee: CustomStringConvertible, Copying {
    
    func clone() -> Employee {
        return Employee(name, address.clone())
    }
    
    
//    required init(copyFrom other: Employee) {
//        name = other.name
//        address = Adress(copyFrom: other.address)
//    }
    
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
    var chris = john.clone()
    chris.name = "Chris"
    chris.address.streetAddress = "124 London Road"
    
    
    print(john)
    print(chris)
}

main()
