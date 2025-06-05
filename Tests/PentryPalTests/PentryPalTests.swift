import XCTest
@testable import PentryPal

final class PentryPalTests: XCTestCase {
    func testInventoryStoreAddItem() {
        let store = InventoryStore()
        store.addItem("Apple")
        XCTAssertEqual(store.items, ["Apple"])
    }
}
