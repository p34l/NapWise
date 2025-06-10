//
//  EntryViewModel.swift
//  NapWise
//
//  Created by Misha Kandaurov on 01.06.2025.
//

import Foundation

class EntryViewModel {
    public struct Input {
    }

    public struct Output {
    }

    public var input = Input()
    public var output: Output = Output()

    var router: EntryRouter!

    var onGreetingUpdated: ((String) -> Void)?

    func loadGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())

        print("Local time is \(hour)")

        let greeting: String
        switch hour {
        case 5 ..< 12: greeting = "Good morning!"
        case 12 ..< 17: greeting = "Good afternoon!"
        case 17 ..< 22: greeting = "Good evening!"
        default: greeting = "Time to rest"
        }
        onGreetingUpdated?(greeting)
    }
}
