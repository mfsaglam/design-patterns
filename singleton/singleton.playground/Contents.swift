import Foundation
import XCTest

protocol Database {
    func getPopulation(_ name: String) -> Int
}

class SingletonDatabase: Database {
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

class SingletonRecordFinder {
    func totalPopulation(_ names: [String]) -> Int {
        var result = 0
        for name in names {
            result += SingletonDatabase.instance.getPopulation(name)
        }
        return result
    }
}

class ConfigurableRecordFinder {
    let database: Database
    
    init(_ database: Database) {
        self.database = database
    }
    
    func totalPopulation(_ names: [String]) -> Int {
        var result = 0
        for name in names {
            result += database.getPopulation(name)
        }
        return result
    }
}

class DummyDatabase: Database {
    func getPopulation(_ name: String) -> Int {
        return ["alpha": 1, "beta": 2, "gamma": 3][name]!
    }
}

func main() {
    let tests = SingletonTests()
    tests.test_singletonPopulationTest()
}

class SingletonTests: XCTestCase {
    
    func test_singletonPopulationTest() {
        let rf = SingletonRecordFinder()
        let names = ["Delhi", "Mexico City"]
        let tp = rf.totalPopulation(names)
        XCTAssertEqual(143_000_000 + 174_000_000, tp, "population size must match")
    }
    
    func test_dependentTotalPopulationTest() {
        let db = DummyDatabase()
        let names = ["alpha", "gamma"]
        let rf = ConfigurableRecordFinder(db)
        XCTAssertEqual(4, rf.totalPopulation(names))
    }
}

func main_old() {
    let db = SingletonDatabase.instance
    var city = "Tokyo"
    print("\(city) has popualation of \(db.getPopulation(city))")
    
    let db2 = SingletonDatabase.instance
    city = "Manila"
    print("\(city) has popualation of \(db.getPopulation(city))")
    print(SingletonDatabase.instanceCount)
}

main()
