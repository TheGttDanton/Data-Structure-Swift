func bubbleSort(_ arr: [Int]) -> [Int] {
    var newArr = arr
    let count = newArr.count
    for i in 0..<(count - 1) {
        for j in 0..<(count - 1 - i) {
            if newArr[j] > newArr[j+1] {
                let temp = newArr[j]
                newArr[j] = newArr[j+1]
                newArr[j+1] = temp
            }
        }
    }
    return newArr
}

let sortedArr = bubbleSort([3,67,1,4,6,4,3])
print(sortedArr)
