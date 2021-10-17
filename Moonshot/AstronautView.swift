//
//  AstronautView.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/16/21.
//

import SwiftUI

struct AstronautView: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronaut: Astronaut
    var joinedMisions: [Mission]
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]

    init(astronaut: Astronaut) {
        self.astronaut = astronaut
        var joinedMisions = [Mission]()

        for mission in missions {
            if mission.joinedCrewNames.lowercased().contains(astronaut.id){
                joinedMisions.append(mission)
            }
        }
        self.joinedMisions = joinedMisions
    }
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text("Joined Missions: \(joinedMisions.count)")

                    LazyVGrid(columns: columns, spacing: 0) {
                        ForEach(joinedMisions) { mission in
                            missionItemView(mission: mission, showCrew: false)
                        }
                    }
                    .padding(.horizontal)

                    Text(astronaut.description)
                        .padding()
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts[3])
    }
}
