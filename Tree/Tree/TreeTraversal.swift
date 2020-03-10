/* Here we will explore different types of Tree traversal
*/

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

node1.rightChild = node2
node1.leftChild = node3

node2.rightChild = node4
node2.leftChild = node5

node3.rightChild = node6
node3.leftChild = node7


//         1
//     3       2
//  7     6   5   4


func inOderTraversal(tree: Tree?) {
    if let tree = tree {
        print(tree.data)
        inOderTraversal(tree: tree.leftChild)
        inOderTraversal(tree: tree.rightChild)
    }
}
print("In order")
inOderTraversal(tree: node1)

func preOrderTraversal(tree: Tree?) {
    if let tree = tree {
        preOrderTraversal(tree: tree.leftChild)
        print(tree.data)
        preOrderTraversal(tree: tree.rightChild)
    }
}
print("Pre order")
preOrderTraversal(tree: node1)


func postOrderTraversal(tree: Tree?) {
    if let tree = tree {
        postOrderTraversal(tree: tree.leftChild)
        postOrderTraversal(tree: tree.rightChild)
        print(tree.data)
    }
}
print("Post order")
postOrderTraversal(tree: node1)