//
//  CheckoutService.swift
//  CheckoutInterview
//

import Foundation
import Combine

class CheckoutService {
    private let session = FakeNetworkSession()

    func fetchOrder() {
        session.getOrder { data in
            print(String(data: data, encoding: .utf8)!)
        }
    }

    func submitOrder(orderId: String) {
        session.submitOrder(orderId: orderId) { data in
            print(String(data: data, encoding: .utf8)!)
        }
    }
}
