import Foundation

class Variable: CustomStringConvertible {
    var name: String = ""
    var type: String = ""
    
    var variables = [Variable]()
    
    private let indentSize = 2
    
    init() {}
    
    init(name: String, type: String) {
        self.name = name
        self.type = type
    }
    
    public var description: String {
        return description(2)
    }
    
    private func description(_ indent: Int) -> String {
        var result = ""
        
        let i = String(repeating: " ", count: indent)
        result += "\(i)var \(name): \(type)\n"
        
        for v in variables {
            result += v.description(indent+2)
        }
        
        return result
    }
}

class CodeBuilder : CustomStringConvertible {
    private let rootName: String
    var root = Variable()
    
    init(_ rootName: String) {
        self.rootName = rootName
        root.name = rootName
    }

    func addField(_ name: String, _ type: String) -> CodeBuilder {
        let v = Variable(name: name, type: type)
        root.variables.append(v)
        return self
    }

    public var description: String {
        return description(0)
    }
    
    private func description(_ indent: Int) -> String {
        var result = ""
        
        let i = String(repeating: " ", count: indent)
        result += "\(i)class \(rootName)\n"
        result += "{\n"
        
        for v in root.variables {
            result += v.description
        }
        
        result += "}"
        return result
    }
}

func main() {
    var cb = CodeBuilder("Person").addField("name", "String").addField("age", "Int")
    print(cb.description)
}

main()
