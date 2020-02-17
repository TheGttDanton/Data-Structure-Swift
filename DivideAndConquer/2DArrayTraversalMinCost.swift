/* Traverse 2D square matrix. from (0,0) to (n-1,n-1). we can only traverse in right and down direction.
   Value in the array indicates min cost to travel that point. 
   Calculate the min cost to reach the final destination.
*/

let array = [[4,7,8,6,4],
            [6,7,3,9,2],
            [3,8,1,2,4],
            [7,1,7,3,7],
            [2,9,8,9,3]]

let n = array.count - 1 // n x n matric 

func calculateMinCost(_ x: Int,_ y: Int) -> Int {
    if x == (n) && y == (n) {
        return array[x][y]
    }

    if x == (n) {
        return array[x][y] + calculateMinCost(x, y + 1)
    } else if y == (n) {
        return array[x][y] + calculateMinCost(x + 1, y)
    } else {
        let downPath = array[x][y] + calculateMinCost(x + 1, y)
        let rightPath = array[x][y] + calculateMinCost(x, y + 1)
        return rightPath > downPath ? downPath : rightPath
    }
}

let minCost = calculateMinCost(0,0)
print(minCost)
