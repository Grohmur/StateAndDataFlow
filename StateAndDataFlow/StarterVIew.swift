//
//  StarterVIew.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct StarterVIew: View {
    @EnvironmentObject var user: UserManager
    
    var body: some View {
        Group {
            if user.isRegister || updateRegistrationStatus() {
                ContentView()
            } else {
                RegisterView()
            }
        }
    }
    
    private func updateRegistrationStatus() -> Bool {
        let storageName = StorageManager.shared.fetchName()
        if storageName == "" {
            return false
        } else {
            user.name = storageName
            return true
        }
    }
}

struct StarterVIew_Previews: PreviewProvider {
    static var previews: some View {
        StarterVIew()
            .environmentObject(UserManager())
    }
}
