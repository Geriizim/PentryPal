import Foundation

public class InventoryStore: Codable {
    public private(set) var items: [String]

    public init(items: [String] = []) {
        self.items = items
    }

    public func add(_ item: String) {
        items.append(item)
    }

    public func save(to url: URL) throws {
        let data = try JSONEncoder().encode(self)
        try data.write(to: url)
    }

    public static func load(from url: URL) throws -> InventoryStore {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(InventoryStore.self, from: data)
    }
}
