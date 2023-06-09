import Foundation

class HtmlElement: CustomStringConvertible {
    var name: String = ""
    var text: String = ""
    var elements = [HtmlElement]()
    
    private let indentSize = 2
    
    init() {}
    
    init(name: String, text: String) {
        self.name = name
        self.text = text
    }
    
    private func description(_ indent: Int) -> String {
        var result = ""
        
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        
        if !text.isEmpty {
            result += String(repeating: " ", count: indent+1)
            result += text
            result += "\n"
        }
        
        for e in elements {
            result += e.description(indent+1)
        }
        
        result += "\(i)</\(name)>\n"
        return result
    }
    
    public var description: String {
        return description(0)
    }
}

class HtmlBuilder: CustomStringConvertible {
    private let rootName: String
    var root = HtmlElement()
    
    init(rootName: String) {
        self.rootName = rootName
        root.name = rootName
    }
    
    func addChild(name: String, text: String) {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
    }
    
    func addChildFluent(name: String, text: String) -> HtmlBuilder {
        let e = HtmlElement(name: name, text: text)
        root.elements.append(e)
        return self
    }
    
    var description: String {
        root.description
    }
    
    func clear() {
        root = HtmlElement(name: rootName, text: "")
    }
}

func main() {
    let hello = "hello"
    var result = "<p>\(hello)</p>"
    print(result)
    
    let words = ["hello", "world"]
    result = "<ul>\n"
    for word in words {
        result.append("<li>\(word)</li>\n")
    }
    result.append("</ul>")
    print(result)
    
    let builder = HtmlBuilder(rootName: "ul")
    builder.addChildFluent(name: "li", text: "hello")
        .addChild(name: "li", text: "world")
    
    print(builder)
}

main()
