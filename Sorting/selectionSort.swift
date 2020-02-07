func selectionSort(_ arr: [Int]) -> [Int] {
    var newArr = arr
    for i in 0..<newArr.count {
        var min = newArr[i]
        for j in (i+1)..<newArr.count {
            if min > newArr[j] {
                let temp = min
                min = newArr[j]
                newArr[j] = temp
            }
        }
        newArr[i] = min
    }
    return newArr
}

let sortedArr = selectionSort([3,67,1,4,6,4,3])
print(sortedArr)