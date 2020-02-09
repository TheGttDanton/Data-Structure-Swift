func merge(_ arr1: [Int],_ arr2: [Int]) -> [Int] {
    var newArr = [Int]()
    var arr1Index = 0
    var arr2Index = 0

    while arr1Index < arr1.count && arr2Index < arr2.count {
        if arr1[arr1Index] < arr2[arr2Index] {
            newArr.append(arr1[arr1Index])
            arr1Index += 1
        } else {
            newArr.append(arr2[arr2Index])
            arr2Index += 1
        }
    }

    if arr1Index < arr1.count {
        while arr1Index < arr1.count {
            newArr.append(arr1[arr1Index])
            arr1Index += 1
        }
    } else if arr2Index < arr2.count {
        while arr2Index < arr2.count {
            newArr.append(arr2[arr2Index])
            arr2Index += 1
        }
    }
    return newArr
}

func mergeSort(_ arr: [Int], start: Int, end: Int) -> [Int] {
    if start < end {
        let middle = start + (end - start) / 2
        let firstHalfSorted = mergeSort(arr, start: start, end: middle)
        let secondHalfSorted = mergeSort(arr, start: middle + 1, end: end)
        return merge(firstHalfSorted, secondHalfSorted)
    }
    return [arr[start]]
}
print(mergeSort([3,67,1,4,6,4,3], start: 0, end: 6))
