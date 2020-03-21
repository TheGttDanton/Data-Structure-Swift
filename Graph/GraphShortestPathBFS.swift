class Queue {
    private var storage = [Vertice]()
    var isEmpty: Bool {
        return storage.isEmpty
    }
    
    func enqueue(_ station: Vertice) {
        storage.append(station)
    }
    
    func dequeue() -> Vertice? {
        let station = storage.first
        storage.removeFirst()
        return station
    }
}

class Vertice {
    let station: String
    let index: Int
    var isVisited = false
    var lastStation: Vertice?
    init(_ name: String, _ index: Int) {
        self.station = name
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
    
    func addRoutes(_ source: Vertice, _ destination: Vertice) {
        let edgeSrcToDest = Edges(source, destination)
        storage[source.index].append(edgeSrcToDest)
        let edgeDestToSrc = Edges(destination, source)
        storage[destination.index].append(edgeDestToSrc)
    }
    
    func getRoute(_ source: Vertice, _ destination: Vertice) {
        let queue = Queue()
        queue.enqueue(source)
        
        while !queue.isEmpty {
            if let intermediate = queue.dequeue(), !intermediate.isVisited {
                if intermediate.station == destination.station {
                    print("Route found")
                    var node: Vertice? = intermediate
                    while node != nil {
                        print(node?.station)
                        node = node?.lastStation
                    }
                }
                intermediate.isVisited = true
                for edges in storage[intermediate.index] {
                    if !edges.destination.isVisited && edges.destination.lastStation == nil {
                        queue.enqueue(edges.destination)
                        edges.destination.lastStation = intermediate
                    }
                }
            }
        }
    }
}

let dmrc = Metro()
let rajivChowk = dmrc.addStation("Rajiv Chowk")
let huda = dmrc.addStation("huda")
let iffco = dmrc.addStation("iffco")
let noida = dmrc.addStation("noida")


dmrc.addRoutes(rajivChowk,huda)
dmrc.addRoutes(huda,iffco)
dmrc.addRoutes(rajivChowk,iffco)

dmrc.getRoute(rajivChowk,iffco)

