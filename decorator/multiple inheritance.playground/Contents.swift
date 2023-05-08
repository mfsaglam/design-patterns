import Foundation

protocol Flyable {
    func fly()
}

protocol Crawlable {
    func crawl()
}

class Bird {
    func fly() { }
}

class Lizard {
    func crawl() { }
}

class Dragon: Flyable, Crawlable {
    private let bird = Bird()
    private let lizard = Lizard()
    
    func fly() {
        bird.fly() // delegation
    }
    
    func crawl() {
        lizard.crawl()
    }
}
