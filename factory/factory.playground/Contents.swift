import Foundation

class Point: CustomStringConvertible {
    private var x, y: Double
    
    private init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    private init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }
    
    var description: String {
        return "x = \(x), y = \(y)"
    }
    
    static let factory = PointFactory()
    
    class PointFactory {
        func createCartesian(x: Double, y: Double) -> Point {
            return Point(x: x, y: y)
        }
        
        func createPolar(rho: Double, theta: Double) -> Point {
            return Point(rho: rho, theta: theta)
        }
    }
}

func main() {
    let p = Point.factory.createPolar(rho: 1, theta: 2)
    print(p)
}

main()
