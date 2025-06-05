import Foundation

class InventoryStore {
    private(set) var items: [String] = []

    func addItem(_ item: String) {
        items.append(item)
    }
}
