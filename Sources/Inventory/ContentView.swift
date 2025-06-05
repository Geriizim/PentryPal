import Foundation

/// Simplified stand-in for a SwiftUI view. Provides basic interaction with an
/// `InventoryStore` so the command-line tool and tests can manipulate items.
public final class ContentView {
    public let store: InventoryStore

    public init(store: InventoryStore = InventoryStore()) {
        self.store = store
    }

    @discardableResult
    public func addItem(name: String,
                        quantity: Int,
                        weight: Double,
                        expirationDate: Date? = nil) -> InventoryItem {
        store.addItem(name: name,
                      quantity: quantity,
                      weight: weight,
                      expirationDate: expirationDate)
    }

    @discardableResult
    public func updateItem(id: UUID,
                           name: String? = nil,
                           quantity: Int? = nil,
                           weight: Double? = nil,
                           expirationDate: Date? = nil) -> Bool {
        store.updateItem(id: id,
                         name: name,
                         quantity: quantity,
                         weight: weight,
                         expirationDate: expirationDate)
    }

    @discardableResult
    public func deleteItem(id: UUID) -> Bool {
        store.deleteItem(id: id)
    }

    public func items() -> [InventoryItem] {
        store.items
    }
}
