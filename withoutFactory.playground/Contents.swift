import Foundation

class Point {
    var x, y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    init(rho: Double, theta: Double) {
        x = rho * cos(theta)
        y = rho * sin(theta)
    }
}

func main() {
    var p = Point(x: 3, y: 2)
}

main()
