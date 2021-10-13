//
//  Mission.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/12/21.
//

import Foundation
struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }

    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
