//
//  DataStore.swift
//  SingleViewApp
//
//  Created by Денис Александров on 04.06.2024.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    
    var firstNames: [String] = ["John", "Jane", "Alice", "Bob"]
    var lastNames: [String] = ["Doe", "Smith", "Johnson", "Brown"]
    var phones: [String] = ["123-456-7890", "234-567-8901", "345-678-9012", "456-789-0123"]
    var emails: [String] = ["john@example.com", "jane@example.com", "alice@example.com", "bob@example.com"]
    
    private init() {}
}
