// Method 1
/* program to find longest continous 1 occurence in the binary representation of a number. */
func longestBinaryOne(_ number: Int) -> Int {
    var currentLongest = 0
    var current = 0
    var binaryNum = number
    while binaryNum != 0 {
        if binaryNum % 2 == 1 {
            current += 1
        } else {
            current = 0
        }
        if current > currentLongest {
            currentLongest = current
        }
        binaryNum /= 2
    }
    return currentLongest
    
}

print(longestBinaryOne(16))

// Method 2 Using Bit Manipulation

func longestBinaryOneBit(_ number: Int) -> Int {
    var count = 0
    var num = number
    while num != 0 {
        num = num & (num >> 1)
        count += 1
    }
    return count
}

print(longestBinaryOneBit(15))