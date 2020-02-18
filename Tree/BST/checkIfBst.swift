/* Program to check if a binary tree is BST or not
*/
class Tree {
    var data: Int
    var leftChild: Tree?
    var rightChild: Tree?
    init(_ data: Int) {
        self.data = data
    }
}

func checkIfBST(tree: Tree?, maxValue: Int, minValue: Int) -> Bool {
    if tree == nil {
        return true
    }
    let nodeData = tree!.data
    if nodeData < maxValue && nodeData > minValue {
        return checkIfBST(tree: tree?.rightChild, maxValue: maxValue, minValue: nodeData) && checkIfBST(tree: tree?.leftChild, maxValue: nodeData, minValue: minValue)
    } else {
        return false
    }
}

let rootNode = Tree(3)
let child1 = Tree(5)
let child2 = Tree(1)
let child3 = Tree(0)
let child4 = Tree(2)

child2.rightChild = child4
child2.leftChild = child3

rootNode.rightChild = child1
rootNode.leftChild = child2

let checkIfBst = checkIfBST(tree: rootNode, maxValue: Int.max, minValue: Int.min)
print(checkIfBst)
