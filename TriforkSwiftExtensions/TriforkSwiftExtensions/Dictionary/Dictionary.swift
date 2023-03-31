import Foundation

extension Dictionary {

    func combine(other: [Key: Value]) -> [Key: Value] {
        var result: Dictionary<Key, Value> = self
        other.forEach { (entry: (key: Key, value: Value)) in
            result[entry.key] = entry.value
        }
        return result
    }
}
