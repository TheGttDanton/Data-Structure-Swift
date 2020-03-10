let array = [1,2,3,4,5,6]

func constructSegmentTree() -> [Int] {
    var segmentTree = [Int](repeating: 0, count: 20)
    
    func populateSegmentTree(start: Int, end: Int, indexOfArray: Int) -> Int {
        if start == end {
            segmentTree[indexOfArray] = array[start]
            return array[start]
        }
        let mid = start + (end - start) / 2
        segmentTree[indexOfArray] = populateSegmentTree(start: start, end: mid, indexOfArray: 2 * indexOfArray) + populateSegmentTree(start: mid + 1, end: end, indexOfArray: 2 * indexOfArray + 1)
        return segmentTree[indexOfArray]
    }

    _ = populateSegmentTree(start: 0, end: array.count - 1, indexOfArray: 1)
    return segmentTree
}

let segmentTree = constructSegmentTree()

func getSum(from: Int, to: Int) -> Int {
     func getSumFromSegmentTree(segmentTreeIndex: Int, start: Int, end: Int, from: Int, to: Int ) -> Int {
         if from <= start && end <= to {
             return segmentTree[segmentTreeIndex]
         } else if end < from || start > to {
             return 0
         } else {
             let mid = start + (end - start) / 2
             return getSumFromSegmentTree(segmentTreeIndex: 2 * segmentTreeIndex, start: start, end: mid, from: from, to: to) + 
             getSumFromSegmentTree(segmentTreeIndex: 2 * segmentTreeIndex + 1, start: mid + 1, end: end, from: from, to: to)
         }
     }
     return getSumFromSegmentTree(segmentTreeIndex: 1, start: 0, end: array.count - 1, from: from, to: to)
}

let sum = getSum(from: 0, to: 5)
print(sum)

