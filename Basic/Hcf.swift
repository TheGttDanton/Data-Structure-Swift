/* Function to calculate HCF of two numbers
*/

func calculateHCF(num1: Int, num2: Int) {
    let range = (num1 > num2) ? num2 : num1
    var hcf = 1
    for i in 1...range {
        if (num1 % i == 0) && (num2 % i == 0) {
            hcf = i
        }
    }
    print("HCF is \(hcf)")
}

calculateHCF(num1: 98, num2: 56)