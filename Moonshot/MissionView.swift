//
//  MissionView.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/16/21.
//

import SwiftUI

// can put CrewMember as nested struct for join query
struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionView: View {
    let mission: Mission
    let astronauts: [CrewMember]

    init(mission: Mission, astronauts: [Astronaut]) {
        self.mission = mission
        var matches = [CrewMember]()

        for member in mission.crew {
            if let match = astronauts.first(where: {$0.id == member.name}) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        self.astronauts = matches
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.7)
                        .padding(.top)

                    Text(mission.description)
                        .padding()


                    ForEach(astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut)) {
                            AstroanutRowView(crew: crewMember)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }

                    Spacer(minLength: 25) //minLength can adjsut for both VStack/HStack
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
    }
}

struct AstroanutRowView: View {
    let crew: CrewMember
    var body: some View {
        HStack {
            Image(crew.astronaut.id)
                .resizable()
                .frame(width: 83, height: 60)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.primary, lineWidth: 1))

            VStack(alignment: .leading) {
                Text(crew.astronaut.name)
                    .font(.headline)
                Text(crew.role)
                    .foregroundColor(crew.role == "Commander" ? Color.red : .secondary)
            }

            Spacer()
        }
        .padding(.horizontal)
    }
}


struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0], astronauts: astronauts)
    }
}
