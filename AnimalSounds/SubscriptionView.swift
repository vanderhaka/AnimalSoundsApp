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
