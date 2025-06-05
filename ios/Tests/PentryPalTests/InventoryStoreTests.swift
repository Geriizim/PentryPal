import XCTest
@testable import PentryPal

final class InventoryStoreTests: XCTestCase {
    func testAddItem() throws {
        let store = InventoryStore()
        store.add("Apple")
        XCTAssertEqual(store.items, ["Apple"])
    }

    func testSaveAndLoad() throws {
        let store = InventoryStore()
        store.add("Bread")

        let tempDir = FileManager.default.temporaryDirectory
        let fileURL = tempDir.appendingPathComponent("inventory.json")
        try store.save(to: fileURL)

        let loaded = try InventoryStore.load(from: fileURL)
        XCTAssertEqual(loaded.items, ["Bread"])

        try? FileManager.default.removeItem(at: fileURL)
    }
}

