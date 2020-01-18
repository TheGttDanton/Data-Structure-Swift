import Foundation

// Function to print fibonnaci number series upto certain range.

// Method 1
func listFibonnaciSeries(upto range: UInt) {
    var firstNumber = 0
    var secondNumber = 1
    var number = 0
    
    print("\(number)")
    number = secondNumber
    
    for _ in 1..<range {
        print("\(number)")
        number = firstNumber + secondNumber
        firstNumber = secondNumber
        secondNumber = number
    }
}
listFibonnaciSeries(upto: 34)