class Tree {
    let data: Int
    var leftChild: Tree?
    var rightChild: Tree?
    
    init(_ data: Int) {
        self.data = data
    }
}

let rootNode = Tree(8)
let node1 = Tree(3)
let node2 = Tree(10)
let node3 = Tree(1)
let node4 = Tree(6)
let node5 = Tree(14)
let node6 = Tree(4)
let node7 = Tree(7)
let node8 = Tree(13)

rootNode.rightChild = node2
rootNode.leftChild = node1
node1.leftChild = node3
node2.rightChild = node5
node2.leftChild = node4
node4.rightChild = node7
node4.leftChild = node6
node5.leftChild = node8


struct Queue{
    private var items:[Tree?] = []
    var isEmpty: Bool {
        return items.isEmpty
    }
    mutating func enqueue(_ element: Tree?)
    {
        items.append(element)
    }
    
    mutating func dequeue() -> Tree?
    {
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement!
        }
    }
}

func diagonalTraversal(tree: Tree?) {
    if let tree = tree {
        var queue = Queue()
        queue.enqueue(tree)
        while(!queue.isEmpty) {
            var node = queue.dequeue()
            while node != nil {
                print(node!.data)
                queue.enqueue(node?.leftChild)
                node = node?.rightChild
            }
            print("\n")
        }
    }
}
diagonalTraversal(tree: rootNode)
