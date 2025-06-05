import Foundation

public struct InventoryItem: Identifiable, Equatable {
    public let id: UUID
    public var name: String
    public var quantity: Int
    public var weight: Double
    public var expirationDate: Date?

    public init(id: UUID = UUID(),
                name: String,
                quantity: Int,
                weight: Double,
                expirationDate: Date? = nil) {
        self.id = id
        self.name = name
        self.quantity = quantity
        self.weight = weight
        self.expirationDate = expirationDate
    }
}
