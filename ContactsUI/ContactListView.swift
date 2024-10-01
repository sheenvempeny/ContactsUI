//
//  ContactListView.swift
//  ContactsUI
//
//  Created by Sheen on 8/30/24.
//

import SwiftUI

struct ContactListView: View {
    @Environment(ContactListInteractor.self) private var interactor
    var body: some View {
        VStack {
            NavigationStack {
                    List {
                        ForEach(interactor.contatcs, id: \.self) { contact in
                            NavigationLink {
                                ContactDetailsView(contact: contact) { contact in
                                    interactor.update(contact: contact)
                                }
                            } label: {
                                ContactRowView(contact: contact)
                            }
                        }
                        .onDelete(perform: delete(at:))
                    }
                    .navigationTitle("Contacts")
                    .toolbar {
                        EditButton()
                    }
               
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let contact = interactor.contatcs[index]
            interactor.delete(contact: contact)
        }
    }
}

struct ContactDetailsView: View {
    @Environment(\.presentationMode) var presentationMode
    var contact: Contact
    var action: (Contact) -> Void
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Text("Name:")
                TextField("", text: $name)
            }
            HStack(alignment: .top) {
                Text("Email:")
                TextField("", text: $email)
            }
            HStack(alignment: .top) {
                Text("Phone:")
                TextField("", text: $phone)
            }
            Spacer()
        }
        .padding(.horizontal, 10.0)
        .onAppear() {
            name = contact.name ?? ""
            email = contact.email ?? ""
            phone = contact.phone ?? ""
        }
        .toolbar {
            Button("Save") {
                var updatedContact = contact
                updatedContact.name  = name
                updatedContact.email = email
                updatedContact.phone = phone
                action(updatedContact)
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationBarTitle("Update contact")
    }
}
