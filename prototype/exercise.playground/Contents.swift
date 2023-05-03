import Foundation

class Point {
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    
    func deepCopy() -> Point {
        return Point(x: x, y: y)
    }
}

class Line {
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point) {
        self.start = start
        self.end = end
    }
    
    func deepCopy() -> Line {
        return Line(start: Point(x: start.x, y: start.y), end: Point(x: end.x, y: end.y))
    }
}

func main() {
    let startingPoint = Point(x: 2, y: 3)
    let endingPoint = Point(x: 4, y: 5)
    let line1 = Line(start: startingPoint, end: endingPoint)
    var line2 = line1.deepCopy()
    line2.start = Point(x: 6, y: 7)
    line2.end = Point(x: 10, y: 11)
    
    dump(line1)
    dump(line2)
}

main()
