import Foundation

/// In-memory store used for the demo and tests.
public final class InventoryStore {
    public private(set) var items: [InventoryItem] = []

    public init(items: [InventoryItem] = []) {
        self.items = items
    }

    /// Adds a new item to the store.
    @discardableResult
    public func addItem(name: String,
                        quantity: Int,
                        weight: Double,
                        expirationDate: Date? = nil) -> InventoryItem {
        let item = InventoryItem(name: name,
                                 quantity: quantity,
                                 weight: weight,
                                 expirationDate: expirationDate)
        items.append(item)
        return item
    }

    /// Updates an existing item by id. Returns `true` if the item was found
    /// and updated.
    @discardableResult
    public func updateItem(id: UUID,
                           name: String? = nil,
                           quantity: Int? = nil,
                           weight: Double? = nil,
                           expirationDate: Date? = nil) -> Bool {
        guard let idx = items.firstIndex(where: { $0.id == id }) else {
            return false
        }
        if let name = name {
            items[idx].name = name
        }
        if let quantity = quantity {
            items[idx].quantity = quantity
        }
        if let weight = weight {
            items[idx].weight = weight
        }
        if let expirationDate = expirationDate {
            items[idx].expirationDate = expirationDate
        }
        return true
    }

    /// Removes an item by id. Returns `true` if found and removed.
    @discardableResult
    public func deleteItem(id: UUID) -> Bool {
        guard let idx = items.firstIndex(where: { $0.id == id }) else {
            return false
        }
        items.remove(at: idx)
        return true
    }
}
