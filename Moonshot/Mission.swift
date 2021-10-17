//
//  Mission.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/12/21.
//

import Foundation
struct Mission: Codable, Identifiable {
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }

    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }

    var joinedCrewNames: String {
        crew.reduce("") { res, crewRole  in
            if res == "" {
                return "\(crewRole.name.capitalized)"
            } else {
                return "\(res), \(crewRole.name.capitalized)"
            }
        }
    }

    var joinedCrewRoless: String {
        crew.reduce("") { res, crewRole  in
            if res == "" {
                return "\(crewRole.role.capitalized)"
            } else {
                return "\(res), \(crewRole.role.capitalized)"
            }
        }
    }
 
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
}
