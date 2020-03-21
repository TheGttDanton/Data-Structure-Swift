class Node<T>{
    let data: T
    var index: Int
    var isVisited = false
    var totalWeight = Int.max
    var neighbours: [Node<T>] = []

    init(_ data: T, index: Int) {
        self.data = data
        self.index = index
    }
}

class Graph<T> {
    var nodes = [Node<T>]()
    var adjencyMatrix: [[Int]]
    
    init(_ nodes: [Node<T>]) {
        self.nodes = nodes
        self.adjencyMatrix = Array(repeating: Array(repeating: -1, count: nodes.count), count: nodes.count)
    }

    func addUndirectedEdge(_ source: Node<T>, _ destination: Node<T>, weight: Int) {
        let sourceIndex = source.index
        let destinationIndex = destination.index
        
        adjencyMatrix[sourceIndex][destinationIndex] = weight
    }
    
    func bellmanFordSSP(_ source: Node<T>) {
        source.totalWeight = 0
        adjencyMatrix[source.index][source.index] = 0

        for _ in 0...nodes.count - 1 {
            for (currentSource, currentVerticeEdges) in adjencyMatrix.enumerated() {
                for (currentDestination, weight) in currentVerticeEdges.enumerated() {
                    if weight == -1 || nodes[currentSource].totalWeight == Int.max {
                        continue
                    } else {
                        if nodes[currentDestination].totalWeight > nodes[currentSource].totalWeight + weight {
                            nodes[currentDestination].totalWeight = nodes[currentSource].totalWeight + weight
                        }
                    }
                }
            }
        }
        
        for (currentSource, currentVerticeEdges) in adjencyMatrix.enumerated() {
            for (currentDestination, weight) in currentVerticeEdges.enumerated() {
                if weight == -1 || nodes[currentSource].totalWeight == Int.max {
                    continue
                }
                if nodes[currentDestination].totalWeight > nodes[currentSource].totalWeight + weight {
                    print("Negative cycle")
                    return
                }
            }
        }

        for node in nodes {
            print(node.totalWeight)
        }
    }
}

var nodes: [Node<String>] = []
let nodeA = Node("A", index: nodes.count)
nodes.append(nodeA)
let nodeB = Node("B", index: nodes.count)
nodes.append(nodeB)
let nodeC = Node("C", index: nodes.count)
nodes.append(nodeC)
let nodeD = Node("D", index: nodes.count)
nodes.append(nodeD)
let nodeE = Node("E", index: nodes.count)
nodes.append(nodeE)

let graph = Graph(nodes)
graph.addUndirectedEdge(nodeA, nodeC, weight: 6)
graph.addUndirectedEdge(nodeC, nodeD, weight: 2)
graph.addUndirectedEdge(nodeD, nodeC, weight: 1)
graph.addUndirectedEdge(nodeE, nodeD, weight: 2)
graph.addUndirectedEdge(nodeE, nodeB, weight: 4)
graph.addUndirectedEdge(nodeB, nodeA, weight: 3)
graph.addUndirectedEdge(nodeA, nodeD, weight: 6)
graph.addUndirectedEdge(nodeD, nodeB, weight: 1)


graph.bellmanFordSSP(nodeE)
