//
//  AppDelegate.swift
//  AnimalSounds
//
//  Created by Nawaz on 27/05/2023.
//

import Foundation
import UIKit
import RevenueCat
import StoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Purchases.configure(withAPIKey: "appl_DboGMXUcUlrbByxZfsdqVYqDLFS")
        Purchases.shared.delegate = self
        
        return true
    }
    
    private func checkActiveSubscription() {
        Task {
            do {
                let customerInfo = try await Purchases.shared.customerInfo()
                updateSubscriptionStatus(customerInfo)
                let status = !customerInfo.activeSubscriptions.isEmpty
                UserDefaults.standard.set(status, forKey: "activeSubscriptions")
                
                NotificationCenter.default.post(name: Notification.Name("subscriptions"), object: status)
            } catch {
                print(error)
            }
        }
    }
    
    private func updateSubscriptionStatus(_ customerInfo: CustomerInfo) {
            
        
    }
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, receivedUpdated customerInfo: CustomerInfo) {
        updateSubscriptionStatus(customerInfo)
    }
    
    func purchases(_ purchases: Purchases, readyForPromotedProduct product: StoreProduct, purchase startPurchase: @escaping StartPurchaseBlock) {
        
    }
}
