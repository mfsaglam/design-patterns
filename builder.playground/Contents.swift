import Foundation

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
}

main()
