import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSubscribed = false
    
    @ObservedObject var storeManager = StoreManager()
    
    var body: some View {
        VStack {
            Text("Choose a Subscription Plan")
                .font(.title)
                .bold()
                .padding(.top)
            
            ForEach(storeManager.products, id: \.self) { product in
                Button(action: {
                    if isSubscribed {
                        presentationMode.wrappedValue.dismiss()
                        return
                    }
                    
                    storeManager.buyProduct(product)
                }) {
                    VStack {
                        Text(product.localizedTitle)
                            .font(.headline)
                        Text(product.localizedDescription)
                        Text(product.priceString())
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .disabled(isSubscribed)
                .padding(.bottom)
            }
        }
        .padding()
        .onAppear {
            storeManager.fetchProducts()
        }
    }
}

class StoreManager: NSObject, ObservableObject, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    @Published var products: [SKProduct] = []

    private let productIdentifiers: Set<String> = [
        "ASFS2023",
        "ASHS2023",
    ]

    override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async {
            self.products = response.products
        }
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

    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased, .restored:
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

extension SKProduct {
    func priceString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price) ?? "N/A"
    }
}
