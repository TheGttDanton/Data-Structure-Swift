// Method 1

func longestBinaryOne(_ number: Int) {
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
    print(currentLongest)
    
}

longestBinaryOne(16)