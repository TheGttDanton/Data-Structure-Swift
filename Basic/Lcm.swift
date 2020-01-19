/* Function to calculate LCM of two numbers

The approach is as follows:
Get the largest number amoung the two.
If the smaller number perfectly divides it then it is the LCM. If not
Increase the larger number by itself till the second number perfectly divides.
 */
func Lcm(num1: Int, num2: Int) {
    var largerNum = 0
    var smallerNum = 0
    if num1 > num2 {
        largerNum = num1
        smallerNum = num2
    } else {
        largerNum = num2
        smallerNum = num1
    }
    let increaseBy = largerNum
    while largerNum % smallerNum != 0 {
        largerNum += increaseBy
    }
    print("LCM is \(largerNum)")
    
}

Lcm(num1: 25, num2: 5)