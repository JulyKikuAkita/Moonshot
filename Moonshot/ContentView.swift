//
//  ContentView.swift
//  Moonshot
//
//  Created by Ifang Lee on 10/11/21.
//

import SwiftUI

struct CustomText: View {
    var text: String

    var body: some View {
        Text(text)
    }

    init(_ text: String) {
        print("Creating a new custom text")
        self.text = text
    }
}

struct DogeImageView: View {
    var body: some View {
        VStack{
            GeometryReader { geo in
                List{

                    Image("fatty1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width)
                    Image("fatty2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geo.size.width)
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DogeImageView()) {
                    Text("Meet my Doge")
                }
                Image("myFutureNoodles")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: .infinity)
            }
            .navigationTitle("Doge")
        }


        //when we add views to a scroll view they get created immediately.
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                ForEach(0..<10) {
                    CustomText("Row \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }

        // list gerate the row only when scroll to the row
        List{
            ForEach(0..<10) {
                CustomText("List row \($0)")
                    .font(.title)
            }
        }

        NavigationView {
            List(0..<100) {row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
