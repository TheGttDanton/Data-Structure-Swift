class Tree<T>{
    private var storage = [T?](repeating: nil, count: 20)
    private var lastUsedIndex = 0

    func insert(_ element: T) {
        if lastUsedIndex >= 20 {
            fatalError("Max Sized reached")
        }
        lastUsedIndex += 1
        storage.insert(element, at: lastUsedIndex)
    }

    func data(_ index: Int) -> T {
        return storage[index]!
    }

    func lastIndex() -> Int {
        return lastUsedIndex
    }
}

//       1
//     2    3
//    4 5   6 7

// Using this array to represnt this tree
// Left Child Index = 2 * x
// Right Child Index = 2 * x + 1

let tree = Tree<Int>()
tree.insert(1)
tree.insert(2)
tree.insert(3)
tree.insert(4)
tree.insert(5)
tree.insert(6)
tree.insert(7)

func inOrderTraversal(_ tree: Tree<Int>, index: Int) {
    if index > tree.lastIndex() {
        return
    }
    inOrderTraversal(tree, index: index * 2)
    print(tree.data(index))
    inOrderTraversal(tree, index: index * 2 + 1)
}

inOrderTraversal(tree, index: 1)