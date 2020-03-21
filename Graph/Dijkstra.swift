class MinHeap {
    private var storage: [Vertice?] = [nil]
    var isEmpty: Bool {
        return storage.count <= 1
    }
    func extract() -> Vertice? {
        if storage.count >= 2 {
            let top = storage[1]
            storage[1] = storage[storage.count - 1]
            storage.removeLast()
            if storage.count >= 2 {
                heptifyTopToBottom(1)
            }
            return top
        } else {
            return nil
        }
    }
    
    func addData(_ vertice: Vertice?) {
        storage.append(vertice)
        heptifyBottomToTop(storage.count - 1)
    }
    
    func heptifyTopToBottom(_ index: Int) {
        print("heaptify \(index)")
        let totalNode = storage.count - 1
        let rightChildIndex = index * 2 + 1
        let leftChildIndex = index * 2
        
        if rightChildIndex <= totalNode {
            let minChildIndex = storage[rightChildIndex]!.weightTotal > storage[leftChildIndex]!.weightTotal ? leftChildIndex : rightChildIndex
            if storage[minChildIndex]!.weightTotal < storage[index]!.weightTotal {
                let temp = storage[minChildIndex]
                storage[minChildIndex] = storage[index]
                storage[index] = temp
                heptifyTopToBottom(minChildIndex)
            }
        } else if leftChildIndex <= totalNode {
            if storage[leftChildIndex]!.weightTotal < storage[index]!.weightTotal {
                let temp = storage[leftChildIndex]
                storage[leftChildIndex] = storage[index]
                storage[index] = temp
                heptifyTopToBottom(leftChildIndex)
            }
        }
        
    }
    
    func rearrange(_ vertice: Vertice) {
        let index = storage.index(where: { (node) -> Bool in
            return node?.station == vertice.station
        })
        if let index = index {
            heptifyBottomToTop(index)
        }
    }
    
    func printHeap() {
        for node in storage {
            if let node = node {
                print("\(node.station) : \(node.weightTotal)" )
            }
        }
    }
    
    func heptifyBottomToTop(_ index: Int) {
        let parentIndex = index / 2
        if parentIndex <= 0 {
            return
        }
        if storage[parentIndex]!.weightTotal > storage[index]!.weightTotal {
            let temp = storage[parentIndex]
            storage[parentIndex] = storage[index]
            storage[index] = temp
            heptifyBottomToTop(parentIndex)
        }
    }
}

class Vertice {
    let station: String
    let index: Int
    var isVisited = false
    var lastStation: Vertice?
    var weightTotal = Int.max
    init(_ name: String, _ index: Int) {
        self.station = name
        self.index = index
    }
}

class Edges {
    let source: Vertice
    let destination: Vertice
    var weight = 1
    
    init(_ source: Vertice, _ destination: Vertice, _ weight: Int) {
        self.source = source
        self.destination = destination
        self.weight = weight
    }
}


class Metro {
    private var storage: [[Edges]] = []
    private var nodes: [Vertice] = []
    
    func addStation(_ name: String) -> Vertice {
        let index = storage.count
        let station = Vertice(name, index)
        storage.append([])
        nodes.append(station)
        return station
    }
    
    func addRoutes(_ source: Vertice, _ destination: Vertice, _ weight: Int) {
        let edgeSrcToDest = Edges(source, destination, weight)
        storage[source.index].append(edgeSrcToDest)
        let edgeDestToSrc = Edges(destination, source, weight)
        storage[destination.index].append(edgeDestToSrc)
    }
    
    func getRoute(_ source: Vertice, _ destination: Vertice) {
        let heap = MinHeap()
        source.weightTotal = 0
        for node in nodes {
            heap.addData(node)
        }
        while !heap.isEmpty {
            if let vertice = heap.extract() {
                for edge in storage[vertice.index] {
                    if edge.destination.weightTotal > vertice.weightTotal + edge.weight {
                        edge.destination.weightTotal = vertice.weightTotal + edge.weight
                        edge.destination.lastStation = vertice
                        heap.rearrange(edge.destination)
                    }
                }
                heap.printHeap()
            }
        }
        print(destination.weightTotal)
    }
}

let dmrc = Metro()
let rajivChowk = dmrc.addStation("Rajiv Chowk")
let huda = dmrc.addStation("huda")
let iffco = dmrc.addStation("iffco")
let noida = dmrc.addStation("noida")
let yamuna = dmrc.addStation("yamuna")
let central = dmrc.addStation("Central Sect")

dmrc.addRoutes(huda,iffco,10)
dmrc.addRoutes(iffco,central,30)
dmrc.addRoutes(central,rajivChowk,10)
dmrc.addRoutes(central,noida,50)
dmrc.addRoutes(rajivChowk,yamuna,120)
dmrc.addRoutes(yamuna,noida,10)

dmrc.getRoute(yamuna,rajivChowk)


