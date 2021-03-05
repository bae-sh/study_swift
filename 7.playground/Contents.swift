import UIKit

struct Location{
    let x: Int
    let y: Int
}

func distance(current: Location, target: Location) -> Double {
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

struct Store{
    let loc: Location
    let name: String
    let deliverRange = 2.0
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance(current: userLoc, target: loc)
        return distanceToStore < deliverRange
    
    }
}

let store1 = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3 = Store(loc: Location(x: 1, y: 7), name: "cu")


func printCloserStore(currentLocation: Location, stores:[Store]){
    var closestStoreName = " "
    var closestStoreDistance = Double.infinity
    
    for store in stores{
        let distanceToStore = distance(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
        }
    }
    print("Closest store: \(closestStoreName)")
}

let myLocation = Location(x: 2, y: 2)
let stores = [store1, store2, store3]

printCloserStore(currentLocation: myLocation, stores: stores)
