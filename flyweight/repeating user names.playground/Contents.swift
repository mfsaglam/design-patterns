import Foundation

class User {
    var fullName: String
    
    init(_ fullName: String) {
        self.fullName = fullName
    }
    
    var charCount: Int {
        return fullName.utf8.count
    }
}

func main() {
    let user1 = User("John Smith")
    let user2 = User("Jane Smith")
    let user3 = User("Jane Doe")
    
    let totalChars = user1.charCount + user2.charCount + user3.charCount
    
    print("Total number of chars user: \(totalChars)")
}

main()
