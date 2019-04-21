import UIKit
import RealmSwift


class TapManager {
    
    private static let shared = TapManager()
    private let realmInstance = try! Realm()
    private static let realm = shared.realmInstance
    
    private init(){}
    
    static func allObjects() -> [Counts] {
        return Array(realm.objects(Counts.self))
    }
    
    static func addCounts(object: Counts) {
        try! realm.write {
            realm.add(object)
        }
    }
}

