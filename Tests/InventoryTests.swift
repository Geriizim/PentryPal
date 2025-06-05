import XCTest
@testable import Inventory

final class InventoryTests: XCTestCase {
    func testAddUpdateDeleteItem() throws {
        let store = InventoryStore()
        let view = ContentView(store: store)

        // Add
        let item = view.addItem(name: "Apples", quantity: 5, weight: 1.2)
        XCTAssertEqual(store.items.count, 1)
        XCTAssertEqual(store.items.first?.name, "Apples")

        // Update
        let updated = view.updateItem(id: item.id, name: "Green Apples", quantity: 10, weight: 1.5)
        XCTAssertTrue(updated)
        XCTAssertEqual(store.items.first?.name, "Green Apples")
        XCTAssertEqual(store.items.first?.quantity, 10)
        XCTAssertEqual(store.items.first?.weight, 1.5)

        // Delete
        let deleted = view.deleteItem(id: item.id)
        XCTAssertTrue(deleted)
        XCTAssertTrue(store.items.isEmpty)
    }
}
