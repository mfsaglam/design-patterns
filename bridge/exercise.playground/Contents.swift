protocol Renderer {
    var whatToRenderAs: String { get }
}

protocol Renderable {
    var renderer: Renderer { get set }
    func draw() -> String
}

class Shape: Renderable {
    var name: String
    var renderer: Renderer
    
    init(name: String, renderer: Renderer) {
        self.name = name
        self.renderer = renderer
    }
    
    func draw() -> String {
        return "Drawing \(name) as \(renderer.whatToRenderAs)"
    }
}

class Triangle: Shape {
    init(renderer: Renderer) {
        super.init(name: "Triangle", renderer: renderer)
    }
}

class Square: Shape {
    init(renderer: Renderer) {
        super.init(name: "Square", renderer: renderer)
    }
}

class VectorRenderer: Renderer {
    var whatToRenderAs: String {
        return "lines"
    }
}

class RasterRenderer: Renderer {
    var whatToRenderAs: String {
        return "pixels"
    }
}

func main() {
    let vectorRenderer = VectorRenderer()
    let rasterRenderer = RasterRenderer()

    let vectorTriangle = Triangle(renderer: vectorRenderer)
    let rasterTriangle = Triangle(renderer: rasterRenderer)

    let vectorSquare = Square(renderer: vectorRenderer)
    let rasterSquare = Square(renderer: rasterRenderer)

    print(vectorTriangle.draw())
    print(rasterTriangle.draw())
    print(vectorSquare.draw())
    print(rasterSquare.draw())
}

main()
