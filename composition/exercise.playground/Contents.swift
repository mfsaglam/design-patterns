import Foundation

class SingleValue : Sequence {
  var value = 0

  init() {}
  init(_ value: Int) {
    self.value = value
  }

  func makeIterator() -> IndexingIterator<Array<Int>> {
    return IndexingIterator(_elements: [value])
  }
}

class ManyValues : Sequence {
  var values = [Int]()

  func makeIterator() -> IndexingIterator<Array<Int>> {
    return IndexingIterator(_elements: values)
  }

  func add(_ value: Int) {
    values.append(value)
  }
}

extension Sequence where Iterator.Element == Int {
  func sum() -> Int {
    return reduce(0, +)
  }
}

func main() {
    let singleValue = SingleValue(1)
    let manyValues = ManyValues()
    manyValues.add(2)
    manyValues.add(3)
    let s = [AnySequence(singleValue), AnySequence(manyValues)]
            .flatMap { $0 } // flatten the sequence of sequences into a single sequence
            .sum()
    print(s)
}

main()
