import SwiftUI
import StoreKit

struct SubscriptionView: View {
    @ObservedObject var storeManager = StoreManager()
    @Binding var isPresented: Bool

    var body: some View {
        VStack {
            ForEach(storeManager.products, id: \.productIdentifier) { product in
                Button(action: {
                    // Implement purchasing action
                }) {
                    VStack {
                        Text(product.localizedTitle)
                        Text(product.localizedDescription)
                        Text(product.localizedPrice ?? "")

                    }
                }
            }
        }
        .onAppear {
            storeManager.fetchProducts()
        }
    }
}

extension SKProduct {
    func priceString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = self.priceLocale
        return formatter.string(from: self.price) ?? ""
    }
}
