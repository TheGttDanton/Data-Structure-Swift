class Queue<T> {
    var storage = [T]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func enquque(_ data: T) {
        storage.append(data)
    }
    
    func dequeue() -> T {
        if storage.isEmpty {
            fatalError()
        } else {
            let elementAtStart = storage[0]
            storage.remove(at: 0)
            return elementAtStart
        }
    }
}

class Tree<T> {
    var data: T
    var leftChild: Tree<T>?
    var rightChild: Tree<T>?
    
    init(_ data: T) {
        self.data = data
    }
}

//          1
//      2       3
//   4   5   6   7
// 8

var root = Tree(1)
let tree2 = Tree(2)
let tree3 = Tree(3)
let tree4 = Tree(4)
let tree5 = Tree(5)
let tree6 = Tree(6)
let tree7 = Tree(7)
let tree8 = Tree(8)

root.leftChild = tree2
root.rightChild = tree3

tree2.leftChild = tree4
tree2.rightChild = tree5

tree3.leftChild = tree6
tree3.rightChild = tree7

tree4.leftChild = tree8

/// Program for inserting New Node

func insert(_ newNode: Tree<Int>, tree: Tree<Int>?) -> Tree<Int>? {
    if tree == nil {
        return newNode
    } else {
        let queue = Queue<Tree<Int>>()
        queue.enquque(tree!)
        
        while !queue.isEmpty {
            let tree = queue.dequeue()
            if let leftChild = tree.leftChild {
                queue.enquque(leftChild)
            } else {
                tree.leftChild = newNode
                break
            }
            
            if let rightChild = tree.rightChild {
                queue.enquque(rightChild)
            } else {
                tree.rightChild = newNode
                break
            }
        }
        return tree
    }
}

func levelOrderTraversel(_ tree: Tree<Int>?) {
    if tree == nil {
        return
    }
    let queue = Queue<Tree<Int>>()
    queue.enquque(tree!)
    
    while !queue.isEmpty {
        let tree = queue.dequeue()
        print(tree.data)
        if let leftChild = tree.leftChild {
            queue.enquque(leftChild)
        }
        if let rightChild = tree.rightChild {
            queue.enquque(rightChild)
        }
    }
}

let newNode = Tree(9)
root = insert(newNode, tree: root)!
levelOrderTraversel(root)

// Program for deletion

func deleteNode(tree: Tree<Int>, node: Tree<Int>?) {
    let queue = Queue<Tree<Int>>()
    queue.enquque(tree)
    while !queue.isEmpty {
        let tree = queue.dequeue()
        if let leftChild = tree.leftChild {
            queue.enquque(leftChild)
            if node === tree.leftChild {
                tree.leftChild = nil
                break
            }
        }
        if let rightChild = tree.rightChild {
            queue.enquque(rightChild)
            if node === tree.rightChild {
                tree.rightChild = nil
                break
            }
        }
    }
}

func deleteNodewith(_ data: Int, tree: Tree<Int>) -> Bool {
    let queue = Queue<Tree<Int>>()
    queue.enquque(tree)
    var nodeFound: Tree<Int>?
    var deepestNode: Tree<Int>?
    while !queue.isEmpty {
        let tree = queue.dequeue()
        if data == tree.data {
            nodeFound = tree
        }
        if let leftChild = tree.leftChild {
            queue.enquque(leftChild)
        }
        if let rightChild = tree.rightChild {
            queue.enquque(rightChild)
        }
        deepestNode = tree
    }
    if nodeFound != nil {
        nodeFound?.data = deepestNode!.data
        deleteNode(tree: tree, node: deepestNode)
        return true
    } else {
        return false
    }
}


print("########################")
let elementFound = deleteNodewith(1, tree: root)
if elementFound {
    print("Element Present")
} else {
    print("Element Not Present")
}
levelOrderTraversel(root)
