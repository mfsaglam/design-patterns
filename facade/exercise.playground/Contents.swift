/*
Façade Coding Exercise
A magic square is a square matrix of numbers where the sum in each row, each column, and each of the diagonals is the same.

You are given a system of 3 classes that can be used to make a magic square. The classes are:

Generator: this class generates a 1-dimensional array of random digits in range 1 to 9.

Splitter: this class takes a 2D array and splits it into all possible arrangements of 1D arrays. It gives you the columns, the rows and the two diagonals.

Verifier: this class takes a 2D array and verifies that the sum of elements in every subarray is the same.

Please implement a Façade class called MagicSquareGenerator  which simply generates the magic square of a given size.

 */

import Foundation

class Generator {
    func generate(_ count: Int) -> [Int] {
        var result = [Int]()
        for _ in 1...count {
            result.append(1 + random()%9)
        }
        return result
    }
}

class Splitter {
    func split(_ array: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        
        let rowCount = array.count
        let colCount = array[0].count
        
        // get the rows
        for r in 0..<rowCount {
            var theRow = [Int]()
            for c in 0..<colCount {
                theRow.append(array[r][c])
            }
            result.append(theRow)
        }
        
        // get the columns
        for c in 0..<colCount {
            var theCol = [Int]()
            for r in 0..<rowCount {
                theCol.append(array[r][c])
            }
            result.append(theCol)
        }
        
        // get the diagonals
        var diag1 = [Int]()
        var diag2 = [Int]()
        for c in 0..<colCount {
            for r in 0..<rowCount {
                if c == r {
                    diag1.append(array[r][c])
                }
                let r2 = rowCount - r - 1
                if c == r2 {
                    diag2.append(array[r][c])
                }
            }
        }
        
        result.append(diag1)
        result.append(diag2)
        
        return result
    }
}

class Verifier {
    func verify(_ arrays: [[Int]]) -> Bool {
        let first = arrays[0].reduce(0, +)
        for arr in 1..<arrays.count {
            if (arrays[arr].reduce(0, +)) != first {
                return false
            }
        }
        return true
    }
}

/*
 In this implementation, the MagicSquareGenerator class has private properties for the Generator, Splitter and Verifier classes, which are used internally to generate and verify the magic square. The generate method first creates a 2D array of size x size with zeros, and then fills it with random digits using the Generator class. It then splits the array into rows, columns and diagonals using the Splitter class, and verifies that all subarrays have the same sum using the Verifier class. If the square is not magic, the method calls itself recursively to generate a new magic square. If the square is magic, it is returned.

 Note that this implementation does not guarantee that it will always terminate and return a valid magic square, as there is a possibility of an infinite loop if it is not possible to generate a magic square of the given size. However, in practice, it is very unlikely to occur.
 */

class MagicSquareGenerator {
    
    private let generator = Generator()
    private let splitter = Splitter()
    private let verifier = Verifier()
    
    func generate(_ size: Int) -> [[Int]] {
        // Create a 2D array of size x size with zeros
        var square = [[Int]](repeating: [Int](repeating: 0, count: size), count: size)
        
        // Fill the square with random digits
        for r in 0..<size {
            for c in 0..<size {
                square[r][c] = generator.generate(1).first!
            }
        }
        
        // Split the square into rows, columns and diagonals
        let arrays = splitter.split(square)
        
        // Verify that all subarrays have the same sum
        guard verifier.verify(arrays) else {
            // If not, generate a new magic square
            return generate(size)
        }
        
        // If the square is magic, return it
        return square
    }
}







