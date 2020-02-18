var myString = "aabaa"
var arr: [String] = []

func allSubsequence(_ index: Int, sequence: String) {
    if index > myString.count - 1 {
        if sequence.isEmpty || arr.contains(sequence) {
            return
        } 
        arr.append(sequence)
        return
    }
    let currentIndex = myString.index(myString.startIndex, offsetBy: index)
    allSubsequence(index + 1, sequence: sequence)
    allSubsequence(index + 1, sequence: sequence + String(myString[currentIndex]))
}

allSubsequence(0,sequence: "")
print(arr)
