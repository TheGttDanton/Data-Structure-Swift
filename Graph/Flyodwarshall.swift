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
        self.adjencyMatrix = Array(repeating: Array(repeating: Int.max, count: nodes.count), count: nodes.count)
    }

    func addUndirectedEdge(_ source: Node<T>, _ destination: Node<T>, weight: Int) {
        let sourceIndex = source.index
        let destinationIndex = destination.index
        
        adjencyMatrix[sourceIndex][destinationIndex] = weight
    }
    
    func floydwarshall() {
        var iterationTable = adjencyMatrix
        for i in 0..<iterationTable.count {
            iterationTable[i][i] = 0
        }
        
        for node in nodes {
            for (currentSource, currentVerticeEdges) in iterationTable.enumerated() {
                for (currentDestination, weight) in currentVerticeEdges.enumerated() {
                    if iterationTable[currentSource][node.index] == Int.max || iterationTable[node.index][currentDestination] == Int.max {
                        continue
                    }
                    if iterationTable[currentSource][currentDestination] > iterationTable[currentSource][node.index] + iterationTable[node.index][currentDestination] {
                        iterationTable[currentSource][currentDestination] = iterationTable[currentSource][node.index] + iterationTable[node.index][currentDestination]
                    }
                }
            }
        }
        print(iterationTable)
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

let graph = Graph(nodes)

graph.addUndirectedEdge(nodeA, nodeB, weight: 8)
graph.addUndirectedEdge(nodeA, nodeD, weight: 1)
graph.addUndirectedEdge(nodeD, nodeC, weight: 9)
graph.addUndirectedEdge(nodeD, nodeB, weight: 2)
graph.addUndirectedEdge(nodeC, nodeA, weight: 4)
graph.addUndirectedEdge(nodeB, nodeC, weight: 1)

graph.floydwarshall()


