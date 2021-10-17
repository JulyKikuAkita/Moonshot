//
//  ContentView.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/11/21.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: astronauts)) {
                    missionItemView(mission: mission)
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct missionItemView: View {
    var mission: Mission
    var body: some View {
        Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: 44, height: 44)

        VStack(alignment: .leading){
            Text(mission.displayName)
                .font(.headline)
            Text(mission.formattedLaunchDate)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
