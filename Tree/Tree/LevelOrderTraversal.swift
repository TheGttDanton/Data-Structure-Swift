class Queue<T> {
    private var storage: [T] = []
    func enqueue(_ element: T) {
        storage.append(element)
    }
    func dequeue() -> T {
        guard !storage.isEmpty else {
            fatalError()
        }
        let element = storage[0]
        storage.remove(at: 0)
        return element
    }
    func isEmpty() -> Bool {
        return storage.isEmpty
    }
}

func levelOrderTraversal(_ tree: Tree) {
    let queue = Queue<Tree?>()
    queue.enqueue(tree)

    while !queue.isEmpty() {
        let element = queue.dequeue()
        print(element!.data)
        if let leftChild = element?.leftChild {
            queue.enqueue(leftChild)
        }
        if let rightChild = element?.rightChild {
            queue.enqueue(rightChild)
        }
    }
}



// Constructing the Tree
class Tree {
    var data: Int
    var rightChild: Tree?
    var leftChild: Tree?

    init(data: Int) {
        self.data = data
    }
}

let node1 = Tree(data: 1)
let node2 = Tree(data: 2)
let node3 = Tree(data: 3)
let node4 = Tree(data: 4)
let node5 = Tree(data: 5)
let node6 = Tree(data: 6)
let node7 = Tree(data: 7)

//         1
//     3       2
//  7     6   5   4

node1.rightChild = node2
node1.leftChild = node3

node2.rightChild = node4
node2.leftChild = node5

node3.rightChild = node6
node3.leftChild = node7

levelOrderTraversal(node1)