let array = [-1,2,-3]

func countNegativeProductSub(_ currentProduct: Int, _ index: Int) -> Int {
    if index > array.count - 1 {
        return 0
    }
    var count = 0
    if currentProduct * array[index] < 0 {
            count += 1
    }
    return count + countNegativeProductSub(currentProduct * array[index] , index + 1) + countNegativeProductSub(currentProduct, index + 1)
}

let count = countNegativeProductSub(1,0)
print(count)
