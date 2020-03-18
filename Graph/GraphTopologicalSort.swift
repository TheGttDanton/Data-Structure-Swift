class Stack <T>{
    private var storage = [T]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func push(_ data: T) {
        storage.append(data)
    }
    
    func pop() -> T? {
        let data = storage.last
        storage.removeLast()
        return data
    }
}

class Vertice {
    let data: String
    let index: Int
    var isVisited = false
    init(_ name: String, _ index: Int) {
        self.data = name
        self.index = index
    }
}

class Edges {
    let source: Vertice
    let destination: Vertice
    var weight = 1
    
    init(_ source: Vertice, _ destination: Vertice) {
        self.source = source
        self.destination = destination
    }
}


class Graph {
    private var storage: [[Edges]] = []
    var nodes: [Vertice] = []
    private let stack = Stack<String>()

    func addNode(_ name: String) -> Vertice {
        let index = storage.count
        let node = Vertice(name, index)
        storage.append([])
        nodes.append(node)
        return node
    }
    
    func addEdge(_ source: Vertice, _ destination: Vertice) {
        let edgeSrcToDest = Edges(source, destination)
        storage[source.index].append(edgeSrcToDest)
    }
    
    func topologicalSort() {
        for node in nodes {
            if !node.isVisited {
                topologicalIteration(node)
            }
        }
        
        while !stack.isEmpty {
            print(stack.pop()!)
        }
    }
    
    func topologicalIteration(_ vertice: Vertice) {
        vertice.isVisited = true
        for edge in storage[vertice.index] {
            if !edge.destination.isVisited {
                topologicalIteration(edge.destination)
            }
        }
        stack.push(vertice.data)
    }
    
}

let graph = Graph()
let node4 = graph.addNode("4")
let node5 = graph.addNode("5")
let node3 = graph.addNode("3")
let node2 = graph.addNode("2")
let node1 = graph.addNode("1")
let node0 = graph.addNode("0")

graph.addEdge(node5, node2)
graph.addEdge(node5, node0)
graph.addEdge(node2, node3)
graph.addEdge(node3, node1)
graph.addEdge(node4, node1)
graph.addEdge(node4, node0)

graph.topologicalSort()
