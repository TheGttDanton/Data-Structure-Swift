/* Let say we have collection of infinite integers
  1,2,3,4,5,6............
  first we delete every second element
  1,3,5,7..........
  then delete every third element
  1,3,7,........
  repeat this process n times

  The numbers remaining are called Lucky number.
  Below is the program to determine if a integer is lucky or not.
*/
func isLucky(number: UInt) -> Bool {
    var position = number
    if number <= 1 {
        return true
    }
    for i in 2...(number) {
        if (position % i) == 0 {
            return false
        } else {
            position = position - ( position / i ) 
        }
    }
    return true
}

print(isLucky(number: 19))
