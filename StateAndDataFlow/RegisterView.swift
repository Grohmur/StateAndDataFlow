//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var user: UserManager
    @State private var name = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name)
                    .multilineTextAlignment(.center)
                Text("\(name.count)")
                    .foregroundColor(nameCheck() ? Color.green : Color.red)
            }.padding(.horizontal)

            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }.foregroundColor(nameCheck() ? Color.blue : Color.gray)
        }
    }
}

extension RegisterView {
    private func registerUser() {
        if nameCheck() {
            StorageManager.shared.saveName(name: name)
            user.name = name
            user.isRegister.toggle()
        }
    }
    
    private func nameCheck() -> Bool {
        name.count > 2
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
