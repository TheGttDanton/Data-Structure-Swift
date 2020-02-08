func insertionSort(_ arr: [Int]) -> [Int] {
    var newArr = arr
    for i in 1..<newArr.count {
        var position = i - 1
        let item = newArr[i]
        newArr[position + 1] = item
        while position >= 0 && item < newArr[position] {
            newArr[position + 1] = newArr[position]
            position -= 1
        }
        newArr[position + 1] = item
    }
    return newArr
}

let sortedArr = insertionSort([3,67,1,4,6,4,3])
print(sortedArr)