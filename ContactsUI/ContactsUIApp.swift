//
//  ContactsUIApp.swift
//  ContactsUI
//
//  Created by Sheen on 8/30/24.
//

import SwiftUI

@main
struct ContactsUIApp: App {
    @State var interactor = ContactListInteractor()
    
    var body: some Scene {
        WindowGroup {
            ContactListView()
        }
        .environment(interactor)
    }
}

