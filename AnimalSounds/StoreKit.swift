import Foundation
import StoreKit

class StoreManager: NSObject, ObservableObject {
    @Published var products: [SKProduct] = []

    private let productIdentifiers: Set<String> = [
        "yourTier1ProductIdentifier",
        "yourTier2ProductIdentifier",
        "yourTier3ProductIdentifier"
    ]

    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }
}




extension StoreManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
        }
    }
}
