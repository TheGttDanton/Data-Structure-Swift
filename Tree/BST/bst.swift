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

func deleteNode(_ data: Int, tree: BST?) -> BST? {
    if let rootData = tree?.data {
        if rootData == data {
            if tree?.leftChild != nil && tree?.rightChild != nil {
                // Both child exists
                let successor = findSuccessor(tree: tree)
                let rightChild = deleteNode(successor!.data, tree: tree?.rightChild)
                tree?.data = successor!.data
                tree?.rightChild = rightChild
                return tree
            } else if tree?.leftChild != nil {
                // Only one child
                return tree?.leftChild
            } else if tree?.rightChild != nil {
                // Only one child
                return tree?.rightChild
            } else {
                // leaf Node
                return nil
            }
            
        } else if rootData > data {
            tree?.leftChild = deleteNode(data, tree: tree?.leftChild)
            return tree
        } else {
            tree?.rightChild = deleteNode(data, tree: tree?.rightChild)
            return tree
        }
    } else {
        return nil
    }
}

func findSuccessor(tree: BST?) -> BST? {
    var successor = tree?.rightChild
    while successor?.leftChild != nil {
        successor = successor?.leftChild
    }
    return successor
}
print("#################")
root = deleteNode(20, tree: root)
inOrder(tree: root)
