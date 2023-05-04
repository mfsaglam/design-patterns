import Foundation

class SingletonDatabase {
    var capitals = [String: Int]()
    static var instanceCount = 0
    
    // singleton
    static let instance = SingletonDatabase()
    
    private init() {
        type(of: self).instanceCount += 1
        print("initializing database")
        
        let path = "/Users/fatihsaglam/Developer/design-patterns/singleton/capitals.txt"
        if let text = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) {
            let strings = text.components(separatedBy: .newlines)
                .filter { !$0.isEmpty }
                .map { $0.trimmingCharacters(in: .whitespaces) }
            
            for i in 0..<(strings.count/2) {
                capitals[strings[i*2]] = Int(strings[i*2+1])!
            }
        }
    }
    
    func getPopulation(_ name: String) -> Int {
        return capitals[name]!
    }
}

func main() {
    let db = SingletonDatabase.instance
    var city = "Tokyo"
    print("\(city) has popualation of \(db.getPopulation(city))")
    
    let db2 = SingletonDatabase.instance
    city = "Manila"
    print("\(city) has popualation of \(db.getPopulation(city))")
    print(SingletonDatabase.instanceCount)
}

main()
