class AVLTree {
    var data: Int
    var rightChild: AVLTree?
    var leftChild: AVLTree?
    init(_ data: Int) {
        self.data = data
    }
}

func heightOfTree(_ tree: AVLTree?) -> Int {
    if tree == nil {
        return -1
    } else {
        let leftChildHeight = heightOfTree(tree?.leftChild)
        let rightChildHeight = heightOfTree(tree?.rightChild)
        return (leftChildHeight > rightChildHeight) ? leftChildHeight + 1 : rightChildHeight + 1
    }
}

func leftRotation(_ tree: AVLTree?) -> AVLTree? {
    var rightChild = tree?.rightChild
    tree?.rightChild = rightChild?.leftChild
    rightChild?.leftChild = tree
    return rightChild
}

func rightRotation(_ tree: AVLTree?) -> AVLTree? {
    var leftChild = tree?.leftChild
    tree?.leftChild = leftChild?.rightChild
    leftChild?.rightChild = tree
    return leftChild
}

func insert(tree: AVLTree?, _ data: Int) -> AVLTree? {
    if tree == nil {
        return AVLTree(data)
    } else if tree!.data > data {
        tree?.leftChild = insert(tree: tree?.leftChild, data)
    } else {
        tree?.rightChild = insert(tree: tree?.rightChild, data)
    }
    let balance = heightOfTree(tree?.leftChild) - heightOfTree(tree?.rightChild)
    if balance > 1 {
        // Left
        let balance = heightOfTree(tree?.leftChild?.leftChild) - heightOfTree(tree?.rightChild?.rightChild)
        if balance > 0 {
            // Left left
            return rightRotation(tree)
        } else {
            // Left Right
            tree?.leftChild = leftRotation(tree?.leftChild)
            return rightRotation(tree)
        }
    } else if balance < -1 {
        // Right
        let balance = heightOfTree(tree?.leftChild?.leftChild) - heightOfTree(tree?.rightChild?.rightChild)
        if balance > 0 {
            // Right left
            tree?.rightChild = rightRotation(tree?.rightChild)
            return leftRotation(tree)
        } else {
            // Right Right
            return leftRotation(tree)
        }
    }
    return tree
}

func inOrderTraversal(_ tree: AVLTree?) {
    if let tree = tree {
        inOrderTraversal(tree.leftChild)
        print(tree.data)
        inOrderTraversal(tree.rightChild)
    }
}

var rootNode = insert(tree: nil, 1)
rootNode = insert(tree: rootNode, 2)
print("######")
inOrderTraversal(rootNode)

rootNode = insert(tree: rootNode, 3)
print("######")
inOrderTraversal(rootNode)

rootNode = insert(tree: rootNode, 4)
print("######")
inOrderTraversal(rootNode)

rootNode = insert(tree: rootNode, 5)
print("######")
inOrderTraversal(rootNode)

rootNode = insert(tree: rootNode, 6)
print("######")
inOrderTraversal(rootNode)
