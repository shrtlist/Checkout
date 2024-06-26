//
//  SubmittedView.swift
//  CheckoutInterview
//
//  Created by Marco Abundo on 6/24/24.
//

import SwiftUI

struct SubmittedView: View {
    let status: Status

    var body: some View {
        Text("Status: \(status.localizedString)")
    }
}

#Preview {
    SubmittedView(status: .preparing_order)
}
