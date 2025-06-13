//
//  EntryViewModel.swift
//  NapWise
//
//  Created by Misha Kandaurov on 01.06.2025.
//

import Foundation

class EntryViewModel {
    var router: EntryRouter?

    func getGreetingInfo(for date: Date = Date()) -> GreetingInfo {
        let hour = Calendar.current.component(.hour, from: date)

        switch hour {
        case 5 ..< 12:
            return GreetingInfo(greeting: "Good morning!", imageName: "morning")
        case 12 ..< 17:
            return GreetingInfo(greeting: "Good afternoon!", imageName: "afternoon")
        case 17 ..< 22:
            return GreetingInfo(greeting: "Good evening!", imageName: "evening")
        default:
            return GreetingInfo(greeting: "Time to rest", imageName: "night")
        }
    }
}

struct GreetingInfo {
    let greeting: String
    let imageName: String
}
