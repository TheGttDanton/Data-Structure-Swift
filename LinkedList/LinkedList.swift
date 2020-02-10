class LinkedList {
    var data: Int?
    var next: LinkedList?

    init(data: Int) {
        self.data = data
    }
}

let node1 = LinkedList(data: 1)
let node2 = LinkedList(data: 2)
let node3 = LinkedList(data: 3)
let node4 = LinkedList(data: 4)
let node5 = LinkedList(data: 5)
let node6 = LinkedList(data: 6)
let node7 = LinkedList(data: 7)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5
node5.next = node6
node6.next = node7

func traverseLinkedList(list: LinkedList?) {
    var node = list
    while node != nil {
        print(node?.data ?? 0)
        node = node?.next
    }
}

traverseLinkedList(list: node1)

func reverseLinkedList(list: LinkedList?) -> LinkedList? {
    var node = list
    var lastNode: LinkedList? = nil
    while node != nil {
        let temp = node?.next
        node?.next = lastNode
        lastNode = node
        node = temp
    }
    return lastNode
}

_ = reverseLinkedList(list: node1)
traverseLinkedList(list: node7)