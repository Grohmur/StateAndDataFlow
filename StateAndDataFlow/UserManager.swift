//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var isRegister = false
    var name = ""
    
    func updateRegistrationStatus() {
        let storageName = StorageManager.shared.fetchName()
        if storageName != "" {
            name = storageName
            isRegister = true
        } else {
            isRegister = false
        }
    } 
}
