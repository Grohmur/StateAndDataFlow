//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Михаил Зверьков on 23.02.2022.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    private let keyValue = "name"

    private init() {}
    
    func saveName(name: String) {
        UserDefaults.standard.set(name, forKey: keyValue)
    }
    
    func deleteName() {
        UserDefaults.standard.set("", forKey: keyValue)
    }
    
    func fetchName() -> String {
        if let name = UserDefaults.standard.string(forKey: keyValue) {
            return name
        } else {
            return ""
        }
    }
}
