/* Check if a string is palindrome or not
*/

func checkIfPalindrome(_ text: String) -> Bool {
    var start = text.startIndex
    var end = text.index(text.endIndex, offsetBy: -1)

    var counter = 1
    var isPalindrome = true
    while (start < end) {
        if text[start] != text[end] {
            isPalindrome = false
            break
        }
        start = text.index(text.startIndex, offsetBy: counter)
        end = text.index(text.endIndex, offsetBy: -(counter+1))
        counter += 1
    }
    return isPalindrome
}

print(checkIfPalindrome("abbca"))