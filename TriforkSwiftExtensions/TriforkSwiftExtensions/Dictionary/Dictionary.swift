import Foundation

extension Dictionary {

    ///Combines 2 dictionarys.
    ///On collisions will overwrite with the other dictionary
    func combineOverwrite(other: [Key: Value]) -> [Key: Value] {
        combine(other: other) { (key: Key, lhs: Value, rhs: Value) in
            rhs
        }
    }
    
    ///Combines 2 dictionarys.
    ///On collisions will perform the "onCollision" to resolve the resulting value
    func combine(
        other: [Key: Value],
        onCollision: (_ key: Key,_ lhs: Value,_ rhs: Value) -> Value
    ) -> [Key: Value] {
        var result: Dictionary<Key, Value> = self
        other.forEach { (entry: (key: Key, value: Value)) in
            let newValue: Value
            if let existingValue = result[entry.key] {
                newValue = onCollision(entry.key, existingValue, entry.value)
            } else {
                newValue = entry.value
            }
            result[entry.key] = newValue
        }
        return result
    }
    
    
    /// Adds the given element to the list by the key, or puts it into the dictionary
    mutating func addOrPut<T>(
        key: Key,
        element: T
    ) where Value == [T] {
        var result: [T] = self[key] ?? []
        result.append(element)
        self[key] = result
    }
    
}
