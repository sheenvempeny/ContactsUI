//
//  ContactListInteractor.swift
//  ContactsUI
//
//  Created by Sheen on 8/30/24.
//

import Foundation
import Combine
import Observation

protocol ContactListProviding {
  var contatcs: [Contact] { get }
}

protocol ContactListManaging {
    func add(name: String?, email: String?, phone: String?)
    func update(contact: Contact)
    func delete(contact: Contact)
}

typealias ContactListInteractable = ContactListProviding & ContactListManaging

@Observable
class ContactListInteractor: ContactListInteractable {
   var contatcs: [Contact] = []
    
    init() {
        buildDummyContatcs()
    }
}
// #MARK: ContactListManaging
extension ContactListInteractor {
    func add(name: String?, email: String?, phone: String?) {
        
    }
    func update(contact: Contact) {
        contatcs.removeAll(where: { $0.id == contact.id })
        contatcs.append(contact)
    }
    func delete(contact: Contact) {
        contatcs.removeAll(where: { $0.id == contact.id })
    }
}
private extension ContactListInteractor {
    func buildDummyContatcs() {
        var dummyContacts = [Contact]()
        dummyContacts.append(Contact(name: "Sheen",
                                     email: "sheen@gmail.com", phone: "712"))
        dummyContacts.append(Contact(name: "Sonu",
                                     email: "sonu@gmail.com", phone: "775"))
        dummyContacts.append(Contact(name: "Leo",
                                     email: "leo@gmail.com", phone: "712"))
        dummyContacts.append(Contact(name: "Robert",
                                     email: "robert@gmail.com", phone: "713"))
        dummyContacts.append(Contact(name: "Steven",
                                     email: "steven@gmail.com", phone: "714"))
        contatcs = dummyContacts
    }
}
