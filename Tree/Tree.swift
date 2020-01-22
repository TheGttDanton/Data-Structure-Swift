/* Tree Representation in Swift
*/

class Tree {
    var data: Int
    var rightChild: Tree?
    var leftChild: Tree?

    init(data: Int) {
        self.data = data
    }
}