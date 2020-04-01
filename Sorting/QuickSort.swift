var array = [1,32,4,5,2,5,3,2,3,43,34]

func quickSort(min: Int, max: Int) {
    print(min,max)
    if min >= max || min > array.count {
        return
    }
    var i = min
    var j = i - 1
    let pivot = max
    while i <= max {
        if i == max {
            j += 1
            let temp = array[pivot]
            array[pivot] = array[j]
            array[j] = temp
            quickSort(min: min, max: j - 1)
            quickSort(min: j + 1, max: max)
        }
        else if array[i] < array[pivot] {
            j += 1
            if i != j {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
            }
        }
        i += 1
    }
}

quickSort(min: 0, max: array.count - 1)
print(array)
