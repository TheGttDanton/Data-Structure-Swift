class BST {
    var data: Int
    var leftChild: BST?
    var rightChild: BST?
    
    init(_ data: Int) {
        self.data = data
    }
}

func insert(_ data: Int, tree: BST?) -> BST? {
    if let rootData = tree?.data {
        if rootData > data {
            tree?.leftChild = insert(data, tree: tree?.leftChild)
        } else {
            tree?.rightChild = insert(data, tree: tree?.rightChild)
        }
        return tree
    } else {
        return BST(data)
    }
}

var root = insert(20, tree: nil)
root = insert(10, tree: root)
root = insert(30, tree: root)
root = insert(40, tree: root)
root = insert(5, tree: root)
root = insert(15, tree: root)
root = insert(25, tree: root)

func inOrder(tree: BST?) {
    if tree == nil {
        return
    } else {
        inOrder(tree: tree?.leftChild)
        print(tree!.data)
        inOrder(tree: tree?.rightChild)
    }
}

inOrder(tree: root)
