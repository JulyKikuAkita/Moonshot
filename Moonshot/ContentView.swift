//
//  ContentView.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    var message = "decode fail"
    var body: some View {
        Button("Decode Json") {
            let input = """
            {
                "name": "Noodels",
                "address": {
                    "Street": "No 1, Buffalo Ridge"
                    "City": "New York"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct User: Codable {
    var name: String
    var address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
