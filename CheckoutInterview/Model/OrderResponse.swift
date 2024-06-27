//
//  OrderResponse.swift
//  CheckoutInterview
//
//  Created by Marco Abundo on 6/24/24.
//

import Foundation

struct OrderResponse: Decodable {
    let id: String
    let items: [Item]
}

struct Item: Decodable {
    let name: String
    var displayPrice: String?
}
