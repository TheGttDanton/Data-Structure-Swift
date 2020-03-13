struct Heap {
    var storage = [Int]()
    
    mutating func insert(_ data: Int) {
        if storage.count <= 1 {
            storage.append(-1)
        }
        storage.append(data)
        heaptifyBottomToTop(storage.count - 1)
    }
    
    mutating func heaptifyBottomToTop(_ index: Int) {
        if index <= 0 {
            return
        }
        let parentIndex = index / 2
        if storage[parentIndex] > storage[index] {
            swapElements(index, parentIndex)
            heaptifyBottomToTop(parentIndex)
        } else {
            return
        }
    }
    
    mutating func swapElements(_ firstIndex: Int, _ secondIndex: Int) {
        let temp = storage[firstIndex]
        storage[firstIndex] = storage[secondIndex]
        storage[secondIndex] = temp
    }
    
    mutating func extarctElement() -> Int? {
        if storage.count <= 1 {
            return nil
        } else if storage.count == 2{
            return storage.removeLast()
        }
        let rootElement = storage[1]
        storage[1] = storage[storage.count - 1]
        _ = storage.removeLast()
        heaptifyTopToBottom(1)
        return rootElement
    }
    
    mutating func heaptifyTopToBottom(_ index: Int) {
        let leftChildIndex = 2 * index
        let rightChildIndex = 2 * index + 1
        let lastIndex = storage.count - 1
        if leftChildIndex > lastIndex {
            // No Child Exists
            return
        } else if rightChildIndex > lastIndex {
            // Only left Child Exists
            if storage[index] > storage [leftChildIndex] {
                swapElements(index, leftChildIndex)
            }
        } else {
            // Both Child Exists
            let smallerIndex = (storage[rightChildIndex] > storage[leftChildIndex]) ? leftChildIndex : rightChildIndex
            if  storage[index] > storage[smallerIndex] {
                swapElements(index, smallerIndex)
                heaptifyTopToBottom(smallerIndex)
            }
        }
    }
}

var heap = Heap()
heap.insert(23)
heap.insert(90)
heap.insert(100)
heap.insert(148)
heap.insert(24)
heap.insert(38)
heap.insert(1)
print(heap.storage)
print(heap.extarctElement())
print(heap.storage)

print(heap.extarctElement())
print(heap.storage)
