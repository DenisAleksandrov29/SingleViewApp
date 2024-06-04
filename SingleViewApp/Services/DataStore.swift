//
//  DataStore.swift
//  SingleViewApp
//
//  Created by Денис Александров on 04.06.2024.
//

import Foundation

class DataStore {
    static let shared = DataStore()
    
    var people: [Person] = [
        Person(firstName: "John", lastName: "Doe", phone: "123-456-7890", email: "john@example.com"),
        Person(firstName: "Jane", lastName: "Smith", phone: "234-567-8901", email: "jane@example.com"),
        Person(firstName: "Alice", lastName: "Johnson", phone: "345-678-9012", email: "alice@example.com"),
        Person(firstName: "Bob", lastName: "Brown", phone: "456-789-0123", email: "bob@example.com")
    ]
    
    private init() {
        shufflePeople()
    }
    
    func shufflePeople() {
        people.shuffle()
    }
}
