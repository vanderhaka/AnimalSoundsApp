import Foundation
import StoreKit

class StoreManager: NSObject, ObservableObject {
    @Published var products: [SKProduct] = []

    private let productIdentifiers: Set<String> = [
        "ASFS2023",
        "ASHS2023",
    ]
    
    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    func fetchProducts() {
        let request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
    }
    
    func buyProduct(_ product: SKProduct) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)
    }

    func restorePurchases() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

extension StoreManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
        }
    }
}

extension StoreManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased, .restored:
                // Unlock the content here or update the subscription status.
                // For example, you can use UserDefaults or a more secure storage solution like Keychain.
                UserDefaults.standard.set(true, forKey: transaction.payment.productIdentifier)
                queue.finishTransaction(transaction)
            case .failed:
                queue.finishTransaction(transaction)
            default:
                break
            }
        }
    }
}
