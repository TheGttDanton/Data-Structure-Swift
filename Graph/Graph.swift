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
    
    func addStation(_ name: String) -> Vertice {
        let index = storage.count
        let station = Vertice(name, index)
        storage.append([])
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
        for edges in storage[source.index] {
            queue.enqueue(edges.destination)
        }
        
        while !queue.isEmpty {
            if let intermediate = queue.dequeue(), !intermediate.isVisited {
                print(intermediate.station)
                if intermediate.station == destination.station {
                    print("Route found")
                    break
                }
                intermediate.isVisited = true
                for edges in storage[intermediate.index] {
                    queue.enqueue(edges.destination)
                }
            }
        }
        print("No route")
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

dmrc.getRoute(rajivChowk,noida)
