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
}

extension AppDelegate: PurchasesDelegate {
    func purchases(_ purchases: Purchases, completedTransaction transaction: SKPaymentTransaction, withUpdatedInfo purchaserInfo: CustomerInfo) {
        // Handle completed transactions
    }
    
    func purchases(_ purchases: Purchases, receivedUpdatedPurchaserInfo purchaserInfo: CustomerInfo) {
        // Handle updated purchaser info
    }
    
    func purchases(_ purchases: Purchases, failedToUpdatePurchaserInfoWithError error: Error) {
        print("Failed to update purchaser info: \(error.localizedDescription)")
    }
}
