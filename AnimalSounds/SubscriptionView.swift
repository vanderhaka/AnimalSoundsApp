import SwiftUI
import StoreKit
import RevenueCat

struct PackagesUIModel: Identifiable {
    let id: String
    let name: String
    let descrition: String
    let priceText: String
    let buttonText: String
}

class SubscriptionViewModel: NSObject, ObservableObject, PurchasesDelegate {
    @Published var offerings: Offerings?
    
    override init() {
        super.init()
        setupPurchases()
    }
    
    private func setupPurchases() {
        
    }
    
    func getOfferings() {
        
        Purchases.shared.getOfferings { (offerings, error) in
            if let error = error {
                print("Error retrieving offerings: \(error.localizedDescription)")
            } else if let offerings = offerings {
                DispatchQueue.main.async {
                    self.offerings = offerings
                }
            }
        }
    }
    
    func purchase(package: Package) {
        Purchases.shared.purchase(package: package) { (transaction, purchaserInfo, error, userCancelled) in
            if let error = error {
                print("Purchase failed: \(error.localizedDescription)")
            } else if let purchaserInfo = purchaserInfo {
                // Process the purchase and update UI accordingly
                print("Purchase successful! Purchaser info: \(purchaserInfo)")
            } else if userCancelled {
                print("User cancelled the purchase")
            }
        }
    }
    
    func restoreSubscription() {
        Purchases.shared.restorePurchases { (customerInfo, error) in
            if let error = error {
                print("Failed to restore subscription: \(error.localizedDescription)")
            } else if let customerInfo = customerInfo {
                // Process the restored subscription and update UI accordingly
                print("Subscription restored! Purchaser info: \(customerInfo)")
            }
        }
    }
}

struct SubscriptionView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = SubscriptionViewModel()
    
    private var availablePackages: [PackagesUIModel] {
        [PackagesUIModel(id: "ASMS2023",
                         name: "Monthly Plan",
                         descrition: "Go on an adventure with our exclusive monthly deal! Get full access to an extensive collection of over 50 animals, including elephants, T-Rex, lions ands more",
                         priceText: "$4.99 per month - 30% cheaper",
                         buttonText: "Join Now"
                        ),
         PackagesUIModel(id: "ASWS2023",
                         name: "Weekly Plan",
                         descrition: "Unlock a variety of premium animals with our weekly plan! Enjoy access to exclusive content and discover new animals like Elephants, lions, T-Rex and more",
                         priceText: "$1.99 per week - 30% more expensive",
                         buttonText: "Join Now")]
    }
    
    var body: some View {
        
        ZStack {
            ScrollView {
                ZStack(alignment: .topTrailing) {
                    HStack {
                        Spacer()
                        Text("Go Premium!")
                            .foregroundColor(.black)
                            .font(.title)
                        Spacer()
                    }
                    
                    Button(action: {
                        viewModel.restoreSubscription()
                    }) {
                        Text("Restore")
                            .foregroundColor(.black.opacity(0.4))
                            .padding(10)
                    }
                }.padding(.bottom)
                
                VStack {
                    if let offerings = viewModel.offerings {
                        ForEach(offerings.current?.availablePackages ?? []) { package in
                            if let uiModel = availablePackages.first(where: { $0.id == package.identifier }) {
                                SubscriptionPackageCard(uiModel: uiModel) {
                                    viewModel.purchase(package: package)
                                }.padding()
                                    .background(Color.black.opacity(0.2))
                                    .cornerRadius(20)
                            }
                            
                        }
                    } else {
                        ProgressView("Loading...")
                            .foregroundColor(.black)
                            .onAppear(perform: viewModel.getOfferings)
                            .padding(.bottom)
                        
                    }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Close")
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity, minHeight: 57)
                        .background(Color.black)
                        .cornerRadius(16)
                }
                
                Text("– Payment will be charged to iTunes Account at confirmation of purchase\n– Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period\n– Account will be charged for renewal within 24-hours prior to the end of the current period, and identify the cost of the renewal\n– Subscriptions may be managed by the user and auto-renewal may be turned off by going to the user's Account Settings after purchase\n– Any unused portion of a free trial period, if offered, will be forfeited when the user purchases a subscription to that publication, where applicable")
                    .foregroundColor(.black)
                    .font(.caption)
                    .padding(.bottom)
                    
                }
                
            }
        }.padding()
    }
}

struct SubscriptionPackageCard: View {
    let uiModel: PackagesUIModel
    let action: (() -> Void)
    var body: some View {
        VStack(spacing: 8) {
            Group {
                Text(uiModel.name)
                    .font(.title2)
                
                Text(uiModel.descrition)
                    .multilineTextAlignment(.center)
                    .font(.body)
                Text(uiModel.priceText)
                    .multilineTextAlignment(.center)
                    .font(.title3)
            }.foregroundColor(.black)
            
            Button(action: action) {
                Text(uiModel.buttonText)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 57)
                    .background(Color.green)
                    .cornerRadius(16)
            }
        }
    }
}
