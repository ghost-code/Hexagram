import Foundation

public struct Hexagram: Equatable, Hashable, Identifiable {
    
    public var id: Int { number }
    public let lines: UInt8
    public let number: Int
    
    public init?(_ number: Int) {
        self.init(number: number)
    }

    public init?(lines: UInt8) {
        guard lines < 64 else { return nil }
        self.lines = lines
        self.number = Hexagram.linesToIndexTable[Int(lines)] + 1
    }

    public init?(number: Int) {
        guard (1...64).contains(number) else { return nil }
        let index = number - 1
        self.number = number
        self.lines = UInt8(Hexagram.linesToIndexTable.firstIndex { $0 == index }!)
    }

}


// MARK: Computed properties

extension Hexagram {

    public var name: String {
        let characterProperties = character.unicodeScalars.first!.properties
        return String(characterProperties.name!.dropFirst(13)).capitalized
    }

    public var character: Character {
        return Character(UnicodeScalar(19903 + number)!)
    }

    public var upperTrigram: UInt8 {
        return lines & 0b000111
    }

    public var lowerTrigram: UInt8 {
        return lines >> 3
    }

    public var upperTrigramName: String {
        let characterProperties = upperTrigramCharacter.unicodeScalars.first!.properties
        return String(characterProperties.name!.dropFirst(12)).capitalized
    }

    public var lowerTrigramName: String {
        let characterProperties = lowerTrigramCharacter.unicodeScalars.first!.properties
        return String(characterProperties.name!.dropFirst(12)).capitalized
    }

    public var upperTrigramCharacter: Character {
        let upperTrigramIndex = 7 - Int(upperTrigram)
        return Character(UnicodeScalar(9776 + upperTrigramIndex)!)
    }

    public var lowerTrigramCharacter: Character {
        let lowerTrigramIndex = 7 - Int(lowerTrigram)
        return Character(UnicodeScalar(9776 + lowerTrigramIndex)!)
    }

}


// MARK: Look up table

private extension Hexagram {

    static let linesToIndexTable: [Int] = [  1, 22,  7, 19, 15, 34, 44, 11,
                                            14, 51, 38, 52, 61, 55, 30, 32,
                                             6,  3, 28, 58, 39, 63, 46,  5,
                                            45, 17, 47, 56, 31, 49, 27, 43,
                                            23, 26,  2, 41, 50, 20, 16, 24,
                                            35, 21, 62, 36, 54, 29, 48, 12,
                                            18, 40, 59, 60, 53, 37, 57,  9,
                                            10, 25,  4,  8, 33, 13, 42,  0  ]

}
