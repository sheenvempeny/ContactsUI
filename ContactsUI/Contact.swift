//
//  Contact.swift
//  ContactsUI
//
//  Created by Sheen on 8/30/24.
//

import Foundation

struct Contact: Hashable, Identifiable {
    var id = UUID()
    var name: String?
    var email: String?
    var phone: String?
}
