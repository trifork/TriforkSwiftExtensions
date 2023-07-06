import Foundation
extension Sequence {
    
    /// Categorizes this sequence by extracting the key and adding the given element to that list.
    func categorize<Key>(by getKeyBy: (Element) -> Key) -> [Key: [Element]] {
        var categorization: [Key: [Element]] = [:]
        forEach { (item: Element) in
            let key = getKeyBy(item)
            categorization.addOrPut(key: key, element: item)
        }
        return categorization
    }
    
}
