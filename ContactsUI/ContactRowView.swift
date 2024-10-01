//
//  ContactRowView.swift
//  ContactsUI
//
//  Created by Sheen on 8/30/24.
//

import SwiftUI

struct ContactRowView: View {
    var contact: Contact
    var body: some View {
        VStack(alignment: .leading) {
            Text(contact.name ?? "")
            HStack {
                Text(contact.email ?? "")
                Spacer()
                Text(contact.phone ?? "")
            }
        }
    }
}

